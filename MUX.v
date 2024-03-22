`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 12:07:20 PM
// Design Name: 
// Module Name: MUX
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

module MUX #(parameter n=8)(
input [n-1:0] a,b, input sel,
output [n-1:0] y
    );
    
    
    genvar i;
    
    generate 
    for(i=0;i<n;i=i+1) begin 
    mux2x1 m (.sel(sel),.a(a[i]),.b(b[i]),.y(y[i]));
    end 
    endgenerate
endmodule