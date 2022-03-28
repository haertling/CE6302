`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 06:09:37 PM
// Design Name: 
// Module Name: mcu
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


module mcu( input clk,
            input rst,
            output mcu_out
          );
    //init
    assign mcu_out = 0;
    reg  [7:0] PC_reg;

    //fetch
    reg  [7:0] PC1_reg;
    reg [16:0] IR_reg;

    //wire
    wire [7:0] PC0, PC1;
    wire [16:0]IR;

    assign PC0 = PC_reg;

    program_memory PM (.address(PC_reg), .instruction(IR));

    assign PC1 = PC_reg + 8'h1;

    //decode
    reg        RW_reg, PS_reg, MW_reg;
    reg [1:0]  MD_reg, BS_reg;
    reg [2:0]  DA_reg, SH_reg;
    reg [3:0]  FS_reg;
    reg [7:0]  PC2_reg, BUSA_reg, BUSB_reg;

    //wires
    wire       RW, PS, MW, MA, MB, CS;
    wire [1:0] MD, BS;
    wire [2:0] DA, SH, AA, BA;
    wire [3:0] FS;
    wire [5:0] IM;
    wire [7:0] PC1_d, BUSA, BUSB, A_data, B_data, constant;
    wire [16:0] IR_F;

    assign PC1_d=PC1;
    assign IR_F=IR;
    assign IM=IR_F[5:0];
    assign SH=IR_F[2:0];

    /* instruction_decoder modules */ 
    instruction_decoder ID(.instruction(IR_reg),.rw(RW),.ps(PS),.mw(MW),.ma(MA),.mb(MB),.cs(CS),.md(MD),.bs(BS),.da(DA),.aa(AA),.ba(BA),.fs(FS));
    constant_unit CU(.IM(IM), .cs(CS), .constant(constant));
    muxA UUT5(.PC_1(PC1_reg), .A_data(A_data), .MA(MA), .BUSA(BUSA));
    muxB UUT6(.constant(constant), .B_data(B_data), .MB(MB), .BUSB(BUSB));

    //execute
    reg       RW1_reg;
    reg [1:0] MD1_reg;
    reg [2:0] DA1_reg;
    reg [7:0] F_reg, dataMemOut_reg;

    //wires
    wire       RW1, PS1, MW1, zero, N, carry, V;
    wire [1:0] MD1, BS1;
    wire [2:0] DA1, SH1;
    wire [3:0] FS1;
    wire [7:0] BrA, PC2, RAA, BUSB1, F, dataMemOut;

    assign PC2   = PC2_reg;
    assign RW1   = RW;
    assign DA1   = DA;
    assign MD1   = MD;
    assign BS1   = BS;
    assign PS1   = PS;
    assign MW1   = MW;
    assign FS1   = FS;
    assign SH1   = SH;
    assign RAA   = BUSA;
    assign BUSB1 = BUSB;

    branch_addr UUT3(.PC(PC2), .BUSB(BUSB1), .BrA(BrA));
    /* ALU modules */    
    h_alu test_unit( .X(BUSA_reg), .Y(BUSB_reg),      // ALU 8-bit Inputs                 
                     .ALU_Sel(FS1), // ALU Selection
                     .SH(SH1),           // shift amount
                     .Z(F),             // ALU 8-bit Output
                     .c_flag(carry),    // Carry Out Flag
                     .zero_flag(zero),
                     .neg_flag(N),
                     .over_flag(V)      
                    );
    data_memory    DM (.clk(clk), .address(RAA), .write(MW1), .dataIn(BUSB1), .dataOut(dataMemOut));
    muxC UUT7(.PC_1(PC1), .BrA(BrA), .RAA(RAA), .BS(BS1), .PS(PS1), .Z(zero), .PC(PC0));

    //Writeback 
    wire RW2;
    wire [1:0] MD2;
    wire [2:0] DA2;
    wire [7:0] BUSD, F1, dataMemOut1;

    assign F1 = F;
    assign dataMemOut1 = dataMemOut_reg;
    assign RW2 = RW1;
    assign MD2 = MD1;
    assign DA2 = DA1;

    muxD UUT8(.mod_fn_unit(F1), .data_out(dataMemOut1), .flag(1'b0), .MD(MD2), .BUSD(BUSD));
    register_file RF (.clk(clk), .a_address(AA), .b_address(BA), .d_address(DA2), .dataIn(BUSD), .write(RW2), .a_data(A_data), .b_data(B_data));

    initial begin
        PC_reg = 0;
        PC1_reg = 0;
        IR_reg = 0;

        BUSA_reg = 0;
        BUSB_reg = 0;
        RW_reg = 0;
        PS_reg = 0;
        MW_reg = 0;
        DA_reg = 0;
        SH_reg = 0;
        MD_reg = 0;
        BS_reg = 0;
        FS_reg = 0;

        RW1_reg = 0;
        PC2_reg = 0;
        DA1_reg = 0;
        MD1_reg = 0;
        F_reg = 0;
        dataMemOut_reg = 0;
    end

    always @(posedge clk) 
    begin
        if( BS == 2'b00 ) begin
            PC_reg = PC0;

            PC1_reg = PC1;
            IR_reg = IR;

            PC2_reg = PC1_d;
            BUSA_reg = BUSA;
            BUSB_reg = BUSB;
            RW_reg = RW;
            PS_reg = PS;
            MW_reg = MW;
            DA_reg = DA;
            SH_reg = SH;
            MD_reg = MD;
            BS_reg = BS;
            FS_reg = FS;

            RW1_reg = RW1;
            DA1_reg = DA1;
            MD1_reg = MD1;
            F_reg = F;
            dataMemOut_reg = dataMemOut;
        end
    end
endmodule
