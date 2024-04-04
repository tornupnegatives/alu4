// Description: 2-to-1 full adder, with carry
// Author: Caleb Cooke

`default_nettype wire

module add1 (
    input  a,
    input  b,
    input  carry_in,
    output out,
    output carry_out
);

    xor1 x0 (
        .a,
        .b,
        .out(x0out)
    );

    xor1 x1 (
        .a(cin),
        .b(x0out),
        .out
    );

    and1 a0 (
        .a,
        .b,
        .out(a0out)
    );

    and1 a1 (
        .a(x0out),
        .b(cin),
        .out(a1out)
    );

    or1 o0 (
        .a(a1out),
        .b(a0out),
        .out(cout)
    );

endmodule
