`timescale 1ns / 1ps
module alu1(
    input a,
    input b,
    input cin,
    input [2:0] s,
    output r,
    output cout
    );
    /////////////
    // DECODER //
    ///////////// 
    
    ////////////////
    // LOGIC UNIT //
    ////////////////
    logic i0out;
    not1 i0(.a,.r(i0out));
    
    logic a0out;
    and1 a0(.a,.b,.r(a0out));
    
    logic x0out;
    xor1 x0(.a,.b,.r(x0out));
    
    logic o0out;
    or1 o0(.a,.b,.r(o0out));
    /////////
    // ALU //
    /////////
    logic FAout0,COUT0;
    FullAddr FA0(.a,.b,.cin(1'b0),.r(FAout0),.cout(COUT0));
    
    //temp
    assign cout = COUT0;
endmodule
