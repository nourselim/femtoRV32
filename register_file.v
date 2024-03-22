`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 12:56:57 PM
// Design Name: 
// Module Name: register_file
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


module register_file#(parameter n=32)(
input clk, input [4:0] write_ad,read_1,read_2, [n-1:0] data, input wr_enable, input rst,
output [n-1:0] read1_out,read2_out
    );
    integer  i; 
    reg [n-1:0] x[31:0] ;
    always @ (posedge (clk) or posedge (rst)) begin 
    if(rst==1'b1) begin 
  
      for(i=0;i<32;i=i+1) begin 
          x[i]=0; 
      end
    
     end 
    else  begin 
    if(wr_enable==1'b1)
       x[write_ad]<=data;
    end 
    
    end  
    
    assign read1_out=x[read_1];
    assign read2_out=x[read_2];
endmodule
