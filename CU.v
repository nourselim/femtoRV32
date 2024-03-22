`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 01:29:39 PM
// Design Name: 
// Module Name: CU
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


module CU(
input [6:2] opcode, 
output reg branch,memRead,memtoReg,memWrite,ALUsrc,RegWrite, output reg [1:0]ALUop
    );
    
    always @ (*) begin 
    case(opcode)
     5'b01100: begin 
     branch=0; 
     memRead=0; 
     memtoReg=0; 
     ALUop=2'b10; 
     memWrite=0; 
     ALUsrc=0; 
     RegWrite=1; 
     end 
     5'b00000: begin 
     branch=0; 
     memRead=1; 
     memtoReg=1; 
     ALUop=2'b00; 
     memWrite=0; 
     ALUsrc=1; 
     RegWrite=1; 
     end 
     
     5'b01000: begin 
     branch=0; 
     memRead=0; 
     memtoReg=0; 
     ALUop=2'b00; 
     memWrite=1; 
     ALUsrc=1; 
     RegWrite=0; 
     end 
     
     5'b11000: begin 
     branch=1; 
     memRead=0; 
     memtoReg=0; 
     ALUop=2'b01; 
     memWrite=0; 
     ALUsrc=0; 
     RegWrite=0; 
     end 
      
    endcase 
    end 
endmodule
