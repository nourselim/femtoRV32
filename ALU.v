`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 11:59:43 AM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n=8)(
input[3:0] sel, input [n-1:0] a,b,output reg [n-1:0] y, 
output zero_flag

    );
    wire[n-1:0] mux_out, sum_out,and_out,or_out;
    MUX #(.n(n)) mux(.a(~b),.b((b)),.y(mux_out),.sel(sel[2]));
    RCA #(.n(n)) rca(.A(a),.B(mux_out),.sum(sum_out),.cin(sel[2]));
    
    AND #(.n(n)) and_cir (.a(a),.b(b),.y(and_out));
     OR #(.n(n)) or_cir (.a(a),.b(b),.y(or_out));
     
     always @ (*) begin 
     case(sel)  
     4'b0010: 
     y=sum_out;
     4'b0110: 
     y=sum_out; 
     4'b0000: 
     y= and_out; 
     4'b0001:  
     y=or_out;
     default: 
     y= 0;
     endcase 
     end 
    assign zero_flag = y==0? 1:0 ;
    
endmodule
