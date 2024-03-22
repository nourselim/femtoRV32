`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:03:41 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk, rst;
    
    TOP DUT(.clk(clk), .rst(rst)); 
    initial begin
    clk = 1'b0; 
    forever #5 clk = ~clk; 
    end  
    
    initial begin
    rst = 1;
    #10
    rst = 0 ; 
    #10;
    
    
    
    end
    
endmodule
