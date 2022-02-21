`timescale 1ns / 1ps


module tb_instruction_decoder;
reg [16:0]instr;
wire RW,PS,MW,MA,MB,CS;
wire [1:0]MD,BS;
wire [2:0]DA,AA,BA;
wire [3:0]FS;

instruction_decoder uut(.instruction(instr),.rw(RW),.ps(PS),.mw(MW),.ma(MA),.mb(MB),.cs(CS),.md(MD),.bs(BS),.da(DA),.aa(AA),.ba(BA),.fs(FS));

initial begin
    instr = 17'b10011011010001000;//lsl
    #10;
    instr = 17'b00100011010001000;//add
    #10;
    instr = 17'b00000000000000000;//nop
    #10;
    $finish;
    end
endmodule
