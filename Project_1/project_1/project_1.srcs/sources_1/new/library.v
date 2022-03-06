`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 12:30:14 PM
// Design Name: library
// Module Name: 
// Project Name: project 1
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


module constant_unit( input      [5:0] IM,
                      input            cs,
                      output reg [5:0] constant );
    if (cs = 0) begin
        constant = 5'b00000;
    end else begin
        constant = IM;
    end 
                   
endmodule

module xor2(          input  a,
                      input  b,
                      output c );
    assign c=(a^b);
endmodule

module or2(           input  a,
                      input  b,
                      output c );
    assign c=(a|b);
endmodule

module and2(          input  a,
                      input  b,
                      output c );
    assign c=(a&b);
endmodule

module branch_addr( input  PC,
                    input  BUSB,
                    output BrA)
    assign BrA = PC + BUSB;
endmodule 

module branch_inc(  input  PC,
                    output PC_1)
    assign PC_1 = PC + 1;
endmodule

module muxA(  input  PC_1,
              input  A_data,
              input  MA,
              output BUSA)
    if (MA = 0) begin
        assign BUSA = A_data;
    end else begin
        assign BUSA = PC_1;
    end
endmodule

module muxB(  input  constant,
              input  B_data,
              input  MB,
              output BUSB)
    if (MB = 0) begin
        assign BUSB = B_data;
    end else begin
        assign BUSB = constant;
    end
endmodule

module muxC(  input  PC_1,
              input  BrA,
              input  RAA,
              input  MC,
              output PC)
    if (MC = 0) begin
        assign PC = PC_1;
    end else if(MC = 2) begin
        assign PC = RAA;
    end else begin
        assign PC = BrA;
    end
endmodule

module muxD(  input  mod_fn_unit,
              input  data_out,
              input  MD,
              output BUSD)
    if (MD = 0) begin
        assign BUSD = mod_fn_unit;
    end else if(MD = 1) begin
        assign BUSD = data_out;
    end else begin
        assign BUSD = 7'b0000000;
    end
endmodule