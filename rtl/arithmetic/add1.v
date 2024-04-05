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

    ////////////////////////////////////////////////////////////////////////////
    // Sum Logic
    ////////////////////////////////////////////////////////////////////////////

    xor2 x0 (
        .a,
        .b,
        .out(x)
    );

    xor2 x1 (
        .a(carry_in),
        .b(x),
        .out
    );

    ////////////////////////////////////////////////////////////////////////////
    // Carry Logic
    ////////////////////////////////////////////////////////////////////////////

    and2 a0 (
        .a,
        .b,
        .out(y)
    );

    and2 a1 (
        .a  (x),
        .b  (carry_in),
        .out(z)
    );

    or2 o0 (
        .a  (y),
        .b  (z),
        .out(carry_out)
    );

endmodule

`default_nettype none
