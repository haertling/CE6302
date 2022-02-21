`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 03:35:10 PM
// Design Name: 
// Module Name: idtb
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


module idtb;
reg [16:0]instr;
wire RW,PS,MW,MA,MB,CS;
wire [1:0]MD,BS;
wire [2:0]DA,AA,BA;
wire [3:0]FS;

instr_decoder uut(.instr(instr),.RW(RW),.PS(PS),.MW(MW),.MA(MA),.MB(MB),.CS(CS),.MD(MD),.BS(BS),.DA(DA),.AA(AA),.BA(BA),.FS(FS));

initial begin
instr = 17'b00001011010001000;
#10;
instr = 17'b01110011010001000;
#10;
instr = 17'b00000000000000000;
end
endmodule
