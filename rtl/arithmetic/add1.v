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
        .a(a),
        .b(b),
        .y(x)
    );

    xor2 x1 (
        .a(carry_in),
        .b(x),
        .y(out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // Carry Logic
    ////////////////////////////////////////////////////////////////////////////

    and2 a0 (
        .a(a),
        .b(b),
        .y(y)
    );

    and2 a1 (
        .a(carry_in),
        .b(x),
        .y(z)
    );

    or2 o0 (
        .a(y),
        .b(z),
        .y(carry_out)
    );

endmodule

`default_nettype none
