`timescale 1ns / 1ps

module or1(
    input a,
    input b,
    output r
);
    logic aiv, biv;
    not i0(aiv,a);
    not i1(biv,b);
    nand n0(r, aiv, biv);
endmodule
