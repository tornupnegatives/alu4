`default_nettype wire

module alu4 (
    input [3:0] a,
    input [3:0] b,
    input [2:0] select,
    output [3:0] out,
    output carry_out
);

alu1 a0(
    .a(a[0]),
    .b(b[0]),
    .carry_in(1'b0),
    .select(select),
    .out(out[0]),
    .carry_out(carry_out0)
);

alu1 a1(
    .a(a[1]),
    .b(b[1]),
    .carry_in(carry_out0),
    .select(select),
    .out(out[1]),
    .carry_out(carry_out1)
);

alu1 a2(
    .a(a[2]),
    .b(b[2]),
    .carry_in(carry_out1),
    .select(select),
    .out(out[2]),
    .carry_out(carry_out2)
);

alu1 a3(
    .a(a[3]),
    .b(b[3]),
    .carry_in(carry_out2),
    .select(select),
    .out(out[3]),
    .carry_out(carry_out)
);

endmodule
`default_nettype none
