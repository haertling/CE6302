`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 03:32:54 PM
// Design Name: 
// Module Name: id
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


module id(instr,RW,DA,MD,BS,PS,MW,FS,MA,MB,AA,BA,CS,IO);
input [16:0]instr;
output reg RW,PS,MW,MA,MB,CS,IO;
output reg [1:0]MD,BS;
output reg [2:0]DA,AA,BA;
output reg [3:0]FS;
always @(*)
begin
case(instr[16:12])
    5'b00000:    //no operation
        begin
        RW = 0;
        PS = 0;
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
    5'b00001:    //LSL operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0110;
        IO = 0;
        end
    5'b00010:    //JMP operation
        begin
        RW = 0;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b11;
        DA = 3'b0;
        AA = 3'b0;
        BA = 3'b0;
        FS = 4'b0000;
        IO = 0;
        end
    5'b00011:    //ST operation
        begin
        RW = 0;
        PS = 0;
        MW = 1;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b00;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0000;
        IO = 0;
        end
     5'b00100:    //BZ operation
        begin
        RW = 0;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b01;
        DA = 3'b0;
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b1010;
        IO = 0;
        end
     5'b00101:     //SLT operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b1000;
        IO = 0;
        end
     5'b00110:     //SUB operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0010;
        IO = 0;
        end
     5'b00111:     //JML operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 1;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b11;
        DA = instr[11:9];
        AA = 3'b0;
        BA = 3'b0;
        FS = 4'b1010;
        IO = 0;
        end
     5'b01000:     //LSR operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0111;
        IO = 0;
        end
     5'b01001:     //OUT operation
        begin
        RW = 0;
        PS = 0;
        MW = 1;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = 3'b0;
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0000;
        IO = 1;
        end
     5'b01010:     //LD operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b01;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0000;
        IO = 0;
        end          
     5'b01011:     //ORI operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b1001;
        IO = 0;
        end
     5'b01100:     //AND operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0011;
        IO = 0;
        end
     5'b01101:     //BNZ operation
        begin
        RW = 0;
        PS = 1;
        MW = 0;
        MA = 0;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b11;
        DA = 3'b0;
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b1010;
        IO = 0;
        end
     5'b01110:     //ADD operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0001;
        IO = 0;
        end   
     5'b01111:     //MOV operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b1010;
        IO = 0;
        end
     5'b10000:     //XOR operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = instr[5:3];
        FS = 4'b0100;
        IO = 0;
        end
     5'b10001:     //JMR operation
        begin
        RW = 0;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b10;
        DA = 3'b0;
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0000;
        IO = 0;
        end
     5'b10010:     //NOT operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0101;
        IO = 0;
        end
     5'b10011:     //IN operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 0;
        CS = 0;
        MD = 2'b01;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0000;
        IO = 1;
        end      
     5'b10100:     //ADI operation
        begin
        RW = 1;
        PS = 0;
        MW = 0;
        MA = 0;
        MB = 1;
        CS = 1;
        MD = 2'b0;
        BS = 2'b0;
        DA = instr[11:9];
        AA = instr[8:6];
        BA = 3'b0;
        FS = 4'b0001;
        IO = 0;
        end  
    endcase
end
endmodule
