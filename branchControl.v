`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 22:55:02
// Design Name: 
// Module Name: branchControl
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


module branchControl(input branch, zf, cf, input [2:0] func3, output reg y);

always @(*) begin
    if(branch) begin
        case(func3) 
        3'b000: //BEQ
        if(zf)
           y=1; 
        3'b001: //BNE
        if(~zf)
            y=1; 
         3'b100: //BLT
         if(~zf)
            y=1; 
        3'b101: //BGT   
        if(~zf)
            y=1;
        3'b110: //BLTU
        if(~cf)
            y=1;
         3'b111: //BGTU
         if(cf)
            y=1; 
        default: y=0; 
        endcase
    end

end
endmodule
