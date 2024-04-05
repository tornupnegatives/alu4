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
        .a,
        .b,
        .out(x)
    );

    xor2 x1 (
        .a(borrow_in),
        .b(x),
        .out
    );

    ////////////////////////////////////////////////////////////////////////////
    // Borrow Logic
    ////////////////////////////////////////////////////////////////////////////

    not1 n0 (
        .a  (a),
        .out(a_n)
    );

    and2 a0 (
        .a  (a_n),
        .b  (b),
        .out(y)
    );

    not1 n1 (
        .a  (x),
        .out(x_n)
    );

    and2 a1 (
        .a  (x_n),
        .b  (borrow_in),
        .out(z)
    );

    or2 o0 (
        .a  (y),
        .b  (z),
        .out(borrow_out)
    );

endmodule

`default_nettype none
