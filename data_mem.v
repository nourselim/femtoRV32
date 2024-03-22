`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 12:08:13 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem
(input clk, input MemRead, input MemWrite,
input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
reg [31:0] mem [0:63];

always @ (posedge (clk)) begin 
if(MemWrite) 
mem[addr]<=data_in;

end 

initial begin
mem[0]=32'd17;
mem[1]=32'd9;
mem[2]=32'd25;
end
assign data_out= (MemRead ==1'b1)? mem[addr]: 32'b0;
endmodule 
