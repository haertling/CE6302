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
    reg clk, reset;
    wire mcu_out;
    reg [8:0] fpga_in;
    wire [9:0] fpga_out;
    mcu top(clk, reset, fpga_in, fpga_out);


    initial
    begin
        clk = 0;
        fpga_in = 9'b101010101;
        reset = 1;
        #200
        fpga_in = 9'b111111111;
        #500
        fpga_in = 9'b000000000;
        #500
        $finish;   
    end

    always 
    begin
        #10;
        clk =~clk;
    end

endmodule
