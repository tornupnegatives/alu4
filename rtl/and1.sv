`timescale 1ns / 1ps

module and1(
    input a,
    input b,
    output r
    );
    logic iv;
    nand n0(iv,a,b);
    not i0(r, iv);    
endmodule
