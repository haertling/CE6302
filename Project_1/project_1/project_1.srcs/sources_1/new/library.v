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
// https://electronics.stackexchange.com/questions/187513/efficient-way-of-setting-bits-in-verilog interesting link about assign in wire and always block for reg
//////////////////////////////////////////////////////////////////////////////////


module constant_unit( input      [5:0] IM,
                      input            cs,
                      output reg [5:0] constant );
    always @* begin
        if (cs = 0) begin
            constant = 5'b00000;
        end else begin
            constant = IM;
        end
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

module branch_addr( input  [7:0] PC,
                    input  [7:0] BUSB,
                    output [7:0] BrA)
    assign BrA = PC + BUSB;
endmodule 

module branch_inc(  input  [7:0] PC,
                    output [7:0] PC_1)
    assign PC_1 = PC + 1;
endmodule

module muxA(  input  [7:0] PC_1,
              input  [7:0] A_data,
              input  MA,
              output [7:0] BUSA)
    if (MA = 0) begin
        assign BUSA = A_data;
    end else begin
        assign BUSA = PC_1;
    end
endmodule

module muxB(  input  [5:0] constant,
              input  [7:0] B_data,
              input        MB,
              output [7:0] BUSB)
    if (MB = 0) begin
        assign BUSB = B_data;
    end else begin
        assign BUSB = constant;
    end
endmodule

module muxC(  input  [7:0] PC_1,
              input  [7:0] BrA,
              input  [7:0] RAA,
              input  [1:0] MC,
              output [7:0] PC)
    if (MC = 0) begin
        assign PC = PC_1;
    end else if(MC = 2) begin
        assign PC = RAA;
    end else begin
        assign PC = BrA;
    end
endmodule

module muxD(  input  [7:0] mod_fn_unit,
              input  [7:0] data_out,
              input  [1:0] MD,
              output [7:0] BUSD)
    if (MD = 0) begin
        assign BUSD = mod_fn_unit;
    end else if(MD = 1) begin
        assign BUSD = data_out;
    end else begin
        assign BUSD = 7'b0000000;
    end
endmodule