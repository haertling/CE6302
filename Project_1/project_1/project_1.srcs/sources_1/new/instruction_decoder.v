`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create date: 02/14/2022 04:25:23 PM
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
            rw = 0;
            ps = 2'b0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = 3'b0;
            aa = 3'b0;
            ba = 3'b0;
            fs = 4'b0;
        end
        5'b00001: begin //xri
        end
        5'b00010: begin //BZ
            RW = 0;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b01;
            da = 3'b0;
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b1010;
        end
        5'b00011: begin //jmr
            RW = 0;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b10;
            da = 3'b0;
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0000;
        end
        5'b00100: begin //add
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b0001;
        end
        5'b00101: begin //and
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b0011;
        end
        5'b00110: begin //in
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b01;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0000;
        end
        5'b00111: begin //ld
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b01;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0000;
            
        end
        5'b01000: begin //sub
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b0010;
        end
        5'b01001: begin //not
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0101;            
        end
        5'b01010: begin //jml
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 1;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b11;
            da = instr[11:9];
            aa = 3'b0;
            ba = 3'b0;
            fs = 4'b1010;            
        end
        5'b01011: begin //aiu
        end
        5'b01100: begin //ori
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b1001;            
        end
        5'b01101: begin //st
            RW = 0;
            ps = 0;
            mw = 1;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b00;
            da = instr[11:9];
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b0000;            
        end
        5'b01110: begin //out
            RW = 0;
            ps = 0;
            mw = 1;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = 3'b0;
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b0000;
        end
        5'b01111: begin //slt
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = instr[5:3];
            fs = 4'b1000;            
        end
        5'b10000: begin //mov
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b1010;            
        end
        5'b10001: begin //adi
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0001;            
        end
        5'b10010: begin //bnz
            RW = 0;
            ps = 1;
            mw = 0;
            ma = 0;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b11;
            da = 3'b0;
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b1010;            
        end
        5'b10011: begin //lsl
            RW = 1;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 0;
            cs = 0;
            md = 2'b0;
            bs = 2'b0;
            da = instr[11:9];
            aa = instr[8:6];
            ba = 3'b0;
            fs = 4'b0110;            
        end
        5'b10100: begin //jmp
            RW = 0;
            ps = 0;
            mw = 0;
            ma = 0;
            mb = 1;
            cs = 1;
            md = 2'b0;
            bs = 2'b11;
            da = 3'b0;
            aa = 3'b0;
            ba = 3'b0;
            fs = 4'b0000;            
        end


endmodule
