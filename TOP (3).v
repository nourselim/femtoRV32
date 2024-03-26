`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 12:57:51 PM
// Design Name: 
// Module Name: TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP(
input clk, 
input rst ,
   input [1:0]sel_led,
   input [3:0] sel_ssd,
   input ssd_clk, 
  output  [15:0] led_out,
  output[6:0] SSD_out,
  output [3:0] Anode
    );
    wire [31:0] inst_addr, PC_out;
    wire PC_load=1; 
    wire [31:0] instruction;
    wire [7:2]inst_in;
  
    assign inst_in  =PC_out[7:2];
 register #(32) PC(.clk(clk),.rst(rst),.load(PC_load),.D(inst_addr),.Q(PC_out)); 
 inst_mem inst_Mem (.addr(inst_in),.data_out(instruction));
 
 wire branch,mem_read,mem_toreg,mem_write,alu_src,reg_write;
 wire[1:0] alu_op; 
 
 CU control_unit (.opcode(instruction[6:2]),.branch(branch),.memRead(mem_read),.memtoReg(mem_toreg),
 .ALUsrc(alu_src),.RegWrite(reg_write),.ALUop(alu_op),.memWrite(mem_write));
 wire [31:0] wr_data; 
 wire [31:0] read1_data,read2_data; 
 
 register_file RF(.clk(clk),.read_1(instruction[19:15]),.read_2(instruction[24:20]),.write_ad(instruction[11:7]),.data(wr_data),
 .wr_enable(reg_write),.rst(rst),.read1_out(read1_data),.read2_out(read2_data));
 
 wire [31:0] imm; 
 imm_gen imm_Gen (.a(instruction),.imm(imm));
 
 wire [31:0] rf_alu_out; 
 mux_n #(32) rf_alu (.a(imm),.b(read2_data),.sel(alu_src),.y(rf_alu_out));
 wire[3:0] alu_sel;
 ALU_CU alu_cu(.ALUop(alu_op),.inst1(instruction[14:12]),.inst2(instruction[30]),.ALUsel(alu_sel)); 
 wire zf; 
 wire[31:0] alu_res;
 ALU  #(32) alu( .sel(alu_sel),.a(read1_data),.b(rf_alu_out),.zero_flag(zf),.y(alu_res)); 
 
 wire [31:0] read_data;
 data_mem Data_mem (.clk(clk),.addr(alu_res [7:2]),.data_in(read2_data),.MemWrite(mem_write),.MemRead(mem_read),.data_out(read_data));
 
 mux_n #(32) d_mux(.a(read_data),.b(alu_res),.sel(mem_toreg),.y(wr_data)); 
 wire and_mux;
 AND and_gate(.a(branch),.b(zf),.y(and_mux));
 wire [31:0] shifted_out;
 shift_left#(32) shiftleft(.a(imm),.y(shifted_out)); 
 wire [31:0] add_shift_out;
 RCA #(32) add_shift(.A(shifted_out),.B(PC_out),.cin(0),.sum(add_shift_out));
 
 wire [31:0] add_4_out; 
 RCA #(32) add_4 (.A(32'b0000_0000_0000_0000_0000_0000_0000_0100),.B(PC_out),.cin(0),.sum(add_4_out)); 

 mux_n #(32)mux_PC(.a(add_shift_out),.b(add_4_out),.sel(and_mux),.y(inst_addr));
wire [12:0] ssd_out;
  mux_led mux_Led (.inst1(instruction[15:0]),.inst2(instruction[31:16]),
  .cu_concat({2'b0,branch,mem_read,mem_toreg,mem_write,alu_src,reg_write,zf,and_mux,alu_sel}),.y(led_out));
  mux_ssd mux_Ssd(PC_out[12:0], add_4_out [12:0], add_shift_out[12:0],inst_addr[12:0],read1_data[12:0],read2_data[12:0],wr_data[12:0],
   imm[12:0],shifted_out[12:0],rf_alu_out[12:0],alu_res[12:0],read_data[12:0],sel_ssd,ssd_out);
   
   seg_7 SEG_7 (.clk(ssd_clk),.num(ssd_out),.Anode(Anode),.LED_out(SSD_out));
 
endmodule
