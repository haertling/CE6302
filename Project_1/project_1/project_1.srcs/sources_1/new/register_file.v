`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 07:50:36 PM
// Design Name: 
// Module Name: register_file
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


module register_file( input            clk,
                      input      [2:0] a_address,
                      input      [2:0] b_address,
                      input      [2:0] d_address, 
                      input      [7:0] dataIn, 
                      input            write,
                      output reg [7:0] a_data,
                      output reg [7:0] b_data );
    /*There will be a zero register and 7 general purpose registers. The zero register will always
    have a value of 0 that cannot be changed (this will be index 0). The 7 remaining registers
    (indices 1-7) will potentially be overwritten. The A and B Data outputs are controlled by
    the A and B Address inputs, respectively. Whatever the value of A Address is determines
    the register value that will be output to the A Data output. The same applies to the B 
    Address input and the B Data output. The D Address, Data In, and Write Enable inputs
    will be used to control the writing of data to the registers. If writing is enabled by the Write
    Enable input, then when the clock pulses the value from Data In will be stored in the register
    associated with the D Address value (with the exception of the zero register). For example,
    if the D Address input is '010', then the value of Data In will be stored in register 2.*/
    
endmodule
