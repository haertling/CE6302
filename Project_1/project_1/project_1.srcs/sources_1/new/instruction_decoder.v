`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 04:25:23 PM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder( input [16:0] instruction,
                            output           rw,
                            output reg [2:0] da,
                            output reg [1:0] md,
                            output reg [1:0] bs,
                            output reg [1:0] ps,
                            output           mw,
                            output reg [4:0] fs,
                            output           ma,
                            output           mb,
                            output reg [2:0] aa,
                            output reg [2:0] ba,
                            output           cs );
endmodule
