`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 11:37:03 AM
// Design Name: 
// Module Name: register
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


module register #(parameter n=8) (
 input clk,rst,load,input [n-1:0] D,
 output  [n-1:0] Q
    );
    
    wire [n-1:0] mux_out; 
 
    
    genvar i; 
    
    generate 

    for(i=0;i<n;i=i+1) begin 
    flip_flop fp (.clk(clk),.rst(rst),.D(mux_out[i]),.Q(Q[i]));
    mux2x1 mux  (.sel(load),.a(D[i]),.b(Q[i]),.y(mux_out[i]));
    end 
    
    endgenerate
   
endmodule
