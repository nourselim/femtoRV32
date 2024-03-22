`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 01:54:12 PM
// Design Name: 
// Module Name: ALU_CU
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


module ALU_CU(
output reg [3:0] ALUsel, input [1:0] ALUop, input [14:12]inst1, input inst2 
    );
    
    always @ (*) begin
        case(ALUop) 
        2'b00: ALUsel = 4'b0010; 
        2'b01: ALUsel = 4'b0110; 
        2'b10: begin 
            if(inst1 == 0  && inst2 == 0) begin
                ALUsel=4'b0010; 
            end 
            else if(inst1 == 0 && inst2 == 1) begin 
                ALUsel = 4'b0110;
            end
            else if(inst1 == 7 && inst2 == 0) begin
                ALUsel = 4'b0000; 
                end
            else
                ALUsel = 4'b0001;     
               
                
        end
        
        endcase
    end
endmodule
