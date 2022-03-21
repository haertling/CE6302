`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 04:31:59 PM
// Design Name: 
// Module Name: tb_mcu
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


module tb_mcu(

    );
    /* Clocked variables */
    reg  [7:0]  PC2;
    wire [7:0]  PC0, PC1, F, dataMemOut;
    wire [16:0] IR;
    reg         RW0;
    wire        xor_1_out, RW, MW;
    wire [1:0]  BS, MD, PS;
    wire [2:0]  DA;
    wire [3:0]  FS;
    reg  [2:0]  DA0, MD0, SH;
    reg  [7:0]  A, B;

    /* variables */
    reg       Z, BS1, BS0, clk, write;
    wire      xor_0_out, or_out, and_out, carry, zero, N, V, MA, MB, CS;
    reg [1:0] MC;
    wire [2:0] AA, BA;
    reg [3:0] ALU_Sel;
    wire [7:0] BUSB, BrA, A_data, BUSA, B_data, RAA, mod_fn_unit, BUSD, dm_address, constant;

    /* gate modules */
    xor2 xor_0(.a(PS[0]), .b(Z), .c(xor_0_out));
    xor2 xor_1(.a(N), .b(V), .c(xor_1_out));
    or2   UUT1(.a(BS1), .b(xor_0_out), .c(or_out));
    and2  UUT2(.a(BS0), .b(or_out), .c(and_out));
    /* branch modules */
    branch_addr UUT3(.PC(PC2), .BUSB(BUSB), .BrA(BrA));
    branch_inc  UUT4(.PC(PC0), .PC_1(PC1));
    /* mux modules */
    muxA UUT5(.PC_1(PC1), .A_data(A_data), .MA(MA), .BUSA(BUSA));
    muxB UUT6(.constant(constant), .B_data(B_data), .MB(MB), .BUSB(BUSB));
    muxC UUT7(.PC_1(PC1), .BrA(BrA), .RAA(RAA), .MC(MC), .PC(PC0));
    muxD UUT8(.mod_fn_unit(mod_fn_unit), .data_out(dataMemOut), .MD(MD), .BUSD(BUSD));
    /* constant_unit modules */
    constant_unit CU(.IM(IR[5:0]), .cs(CS), .constant(constant));
    /* ALU modules */    
    h_alu test_unit( .X(A), .Y(B),      // ALU 8-bit Inputs                 
                     .ALU_Sel(ALU_Sel), // ALU Selection
                     .SH(SH),           // shift amount
                     .Z(F),             // ALU 8-bit Output
                     .c_flag(carry),    // Carry Out Flag
                     .zero_flag(zero),
                     .neg_flag(N),
                     .over_flag(V)      
                    );
    /* instruction_decoder modules */ 
    instruction_decoder ID(.instruction(IR),.rw(RW),.ps(PS),.mw(MW),.ma(MA),.mb(MB),.cs(CS),.md(MD),.bs(BS),.da(DA),.aa(AA),.ba(BA),.fs(FS));
    /* register_file modules */
    register_file RF (.clk(clk), .a_address(AA), .b_address(BA), .d_address(DA), .dataIn(BUSD), .write(RW), .a_data(A_data), .b_data(B_data));
    /* memory modules */
    program_memory PM (.address(PC0), .instruction(IR));
    data_memory    DM (.clk(clk), .address(dm_address), .write(write), .dataIn(A), .dataOut(dataMemOut));

    initial 
    begin
        clk = 0;
        #45
        $finish;
    end

    always 
    begin
        #5;
        clk =~clk;
    end
endmodule
