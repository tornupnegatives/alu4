`timescale 1ns / 1ps

module xor1(
    input a,
    input b,
    output r
    );
    logic iv0, iv1,iv2;
    nand n10(iv0,a,b);
    nand n20(iv1,a,iv0);
    nand n30(iv2,iv0,b);
    nand n40(r,iv1,iv2);
endmodule
