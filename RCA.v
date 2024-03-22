`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 12:00:41 PM
// Design Name: 
// Module Name: RCA
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

module RCA #(parameter n=8)
(
input [n-1:0] A,B,
output [n:0] sum,
input cin
    );
   wire [n :0] temp_cout; 
   
//    FA add_1 (.A(A[0]),.B(B[0]),.cin(cin),.cout(temp_cout[0]),.sum(sum[0]));
assign temp_cout[0]=cin;
    genvar i; 
    generate 
    for (i=0; i<n;i=i+1) begin
    FA add (.A(A[i]),.B(B[i]),.cin(temp_cout[i]),.sum(sum[i]),.cout(temp_cout[i+1]));
    end 
    endgenerate  
    assign sum[n]=temp_cout[n];
endmodule
