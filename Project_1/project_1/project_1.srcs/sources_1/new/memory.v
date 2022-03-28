`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UTD
// Engineer: Steven 
// 
// Create Date: 01/28/2022 06:31:36 PM
// Design Name: 
// Module Name: program_memory
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


module program_memory( input      [7:0]  address, 
                       output reg [16:0] instruction );
    /*
        The program memory will contain an 256x17 bit memory. It will use the program counter
        as the address and output the corresponding 17-bit instruction from the memory.
    */
    reg[16:0]mem[255:0];
    initial begin
        mem[0] = 17'b00100011001010000;//add
        mem[1] = 17'b01000100001010000;//sub
        mem[2] = 17'b01001101100000000;//not
    end
    always @(address) begin
        instruction = mem[address];
    end
    
endmodule

module data_memory( input            clk,
                    input      [7:0] address, 
                    input            write,
                    input      [7:0] dataIn, 
                    output reg [7:0] dataOut );
    /*
        The data memory will be a 256 byte memory. The address input will be used to determine
        the address being written to or read from. At the edge of the clock, the value of the data
        input will be written to the memory address only if the write enable input is set to
        the correct level. Regardless, the data output will output the byte located in the memory
        at the address being input.
    */
    reg[7:0]mem[255:0];
    always @(negedge clk ) begin
        if(write)
            mem[address] = dataIn;
 
        dataOut = mem[address];
    end
endmodule 

