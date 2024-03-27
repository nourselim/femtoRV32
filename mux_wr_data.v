`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 22:22:19
// Design Name: 
// Module Name: mux_wr_data
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


module mux_wr_data(
input [31:0]wr_data, add_4_out, add_shift_out, input [1:0] sel, 
output reg [31:0] y );

    always @ (*) begin
    case(sel)
    2'b00:
    y = wr_data; 
    2'b01:
    y = add_4_out; 
    2'b10:
    y = add_shift_out; 
    default: y=wr_data; 
    
    endcase
    end

endmodule
