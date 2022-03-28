`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 01:29:46 PM
// Design Name: 
// Module Name: tb_mcu0
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


module tb_mcu0(

    );
    reg clk, rst;
    wire mcu_out;
    mcu top(clk, rst, mcu_out);


    initial
    begin
        clk = 0;
        #200
        $finish;   
    end

    always 
    begin
        #5;
        clk =~clk;
    end

endmodule
