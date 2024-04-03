`timescale 1ns / 1ps
module alu(
    input        [3:0] a, //operand
    input        [3:0] b, //operand
    input        [2:0] s, //operation Select
    
    output logic [3:0] r, //the Result value
    output logic       c, //for unsigned Carry
    output logic       v //for signed oVerflow
);
    logic [2:0] tCout;
    alu1 a0(.a(a[0]),.b(b[0]),.cin(1'b0),.s,.r(r[0]),.cout(tCout[0]));
    alu1 a1(.a(a[1]),.b(b[1]),.cin(tCout[0]),.s,.r(r[1]),.cout(tCout[1]));
    alu1 a2(.a(a[2]),.b(b[2]),.cin(tCout[1]),.s,.r(r[2]),.cout(tCout[2]));
    alu1 a3(.a(a[3]),.b(b[3]),.cin(tCout[2]),.s,.r(r[3]),.cout(c));
endmodule