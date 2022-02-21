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

    always @(*)
    begin
        case(instr[16:12])
        5'b00000: begin //nop
            RW = 0;
            PS = 2'b0;
            MW = 0;
            MA = 0;
            MB = 0;
            CS = 0;
            MD = 2'b0;
            BS = 2'b0;
            DA = 3'b0;
            AA = 3'b0;
            BA = 3'b0;
            FS = 4'b0;
            IO = 0;
        end
        5'b00001: begin //xri
        end
        5'b00010: begin //BZ
        end
        5'b00011: begin //jmr
        end
        5'b00100: begin //add
        end
        5'b00101: begin //and
        end
        5'b00110: begin //in
        end
        5'b00111: begin //ld
        end
        5'b01000: begin //sub
        end
        5'b01001: begin //not
        end
        5'b01010: begin //jml
        end
        5'b01011: begin //aiu
        end
        5'b01100: begin //ori
        end
        5'b01101: begin //st
        end
        5'b01110: begin //out
        end
        5'b01111: begin //slt
        end
        5'b10000: begin //mov
        end
        5'b10001: begin //adi
        end
        5'b10010: begin //bnz
        end
        5'b10011: begin //lsl
        end
        5'b10100: begin //jmp
        end


endmodule
