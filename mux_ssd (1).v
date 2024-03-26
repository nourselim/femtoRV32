`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 11:14:25 AM
// Design Name: 
// Module Name: mux_ssd
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


module mux_ssd(
input [12:0] PC_out, add_4_out, add_shift_out,inst_addr,read1_data,read2_data,wr_data,
imm,shifted_out,rf_alu_out,alu_res,read_data, input [3:0] sel, output reg[12:0] ssd_out
    );
    
    
       
   always @ (*) begin 
   case(sel)
   4'b0000: 
    ssd_out= PC_out; 
    4'b0001: 
    ssd_out=add_4_out;
    4'b0010: 
    ssd_out=add_shift_out ;
    4'b0011: 
    ssd_out=inst_addr;
    4'b0100: 
    ssd_out=read1_data;
    4'b0101: 
    ssd_out= read2_data; 
    4'b0110: 
    ssd_out=wr_data; 
    4'b0111: 
    ssd_out=imm; 
    4'b1000: 
    ssd_out=shifted_out; 
    4'b1001: 
    ssd_out=rf_alu_out; 
    4'b1010:  
    ssd_out=alu_res; 
    4'b1011: 
    ssd_out=read_data; 
    default: 
    ssd_out=PC_out ;
    
   endcase 
   end 
endmodule
