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
                      output reg [7:0] constant );
    reg [1:0] zeroPad = 2'b00;
    reg [1:0] onesPad = 2'b11;
    always @* begin
        if (cs == 0) begin
            constant = {zeroPad,IM};//pad front with 2 zeros
        end else begin
            if(IM[5]==0) begin
                constant = {zeroPad,IM};//pad front with 2 ones if sign bit is negative
            end else begin
                constant = {onesPad,IM};//pad front with 2 ones if sign bit is negative
            end
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
                    output reg [7:0] BrA);
    always @* begin
        BrA = PC + BUSB;
    end
endmodule 

module branch_inc(  input  [7:0] PC,
                    output reg [7:0] PC_1);
    always @* begin
        PC_1 = PC + 1;
    end
endmodule

module muxA(  input  [7:0] PC_1,
              input  [7:0] A_data,
              input  MA,
              output reg [7:0] BUSA);
    always @* begin
        if (MA == 0) begin
            BUSA = A_data;
        end else begin
            BUSA = PC_1;
        end
    end
endmodule

module muxB(  input  [7:0] constant,
              input  [7:0] B_data,
              input        MB,
              output reg [7:0] BUSB);
    always @* begin
        if (MB == 0) begin
            BUSB = B_data;
        end else begin
            BUSB = constant;
        end
    end
endmodule

module muxC(  input  [7:0] PC_1,
              input  [7:0] BrA,
              input  [7:0] RAA,
              input  [1:0] MC,
              output reg [7:0] PC);
    always @* begin
        if (MC == 0) begin
            PC = PC_1;
        end else if(MC == 2) begin
            PC = RAA;
        end else begin
            PC = BrA;
        end
    end
endmodule

module muxD(  input  [7:0] mod_fn_unit,
              input  [7:0] data_out,
              input        flag,
              input  [1:0] MD,
              output reg [7:0] BUSD);
    always @* begin
        if (MD == 0) begin
            BUSD = mod_fn_unit;
        end else if(MD == 1) begin
            BUSD = data_out;
        end else begin
            BUSD = {7'b0,flag};
        end
    end
endmodule