`timescale 1ns / 1ps

module FullAddr(
    input a,
    input b,
    input cin,
    output logic r,
    output logic cout
    );
    logic x0out,a0out,a1out;
    xor1 x0 ( .a,.b,.r(x0out));
    xor1 x1 (.a(cin),.b(x0out),.r);
    and1 a0 (.a,.b,.r(a0out));
    and1 a1 (.a(x0out),.b(cin),.r(a1out));
    or1 o0 (.a(a1out),.b(a0out),.r(cout));
endmodule
