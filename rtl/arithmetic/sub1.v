// Description: 2-to-1 full subtractor, with borrow
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module sub1 (
    input  a,
    input  b,
    input  borrow_in,
    output out,
    output borrow_out
);

    ////////////////////////////////////////////////////////////////////////////
    // Difference Logic
    ////////////////////////////////////////////////////////////////////////////

    xor2 x0 (
        .a(a),
        .b(b),
        .y(x)
    );

    xor2 x1 (
        .a(borrow_in),
        .b(x),
        .y(out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // Borrow Logic
    ////////////////////////////////////////////////////////////////////////////

    inv1 i0 (
        .a  (a),
        .y(a_n)
    );

    and2 a0 (
        .a  (a_n),
        .b  (b),
        .y(y)
    );

    inv1 i1 (
        .a  (x),
        .y(x_n)
    );

    and2 a1 (
        .a  (x_n),
        .b  (borrow_in),
        .y(z)
    );

    or2 o0 (
        .a  (y),
        .b  (z),
        .y(borrow_out)
    );

endmodule

`default_nettype none
