`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 10:57:07 AM
// Design Name: 
// Module Name: mux_led
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


module mux_led (
input [15:0] inst1, input [31:16] inst2, [15:0] cu_concat,input [1:0] sel,
output reg [15:0] y
    );
    
   always @ (*) begin 
   case(sel)
   2'b00: 
    y= inst1; 
    2'b01: 
    y=inst2; 
    2'b10: 
    y=cu_concat; 
    
    default: 
    y=inst1;
    
   endcase 
   end 
endmodule
