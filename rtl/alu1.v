`default_nettype wire

module alu1 (
    input a,
    input b,
    input carry_in,
    input [2:0] select,
    output out,
    output carry_out
);

    ////////////////////////////////////////////////////////////////////////////
    // LOGIC UNITS
    ////////////////////////////////////////////////////////////////////////////

    and2 and2_ (
        .a  (a),
        .b  (b),
        .out(and_out)
    );

    not1 not1_ (
        .a  (a),
        .out(not_out)
    );

    or2 or2_ (
        .a  (a),
        .b  (b),
        .out(or_out)
    );

    xor2 xor2_ (
        .a  (a),
        .b  (b),
        .out(xor_out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // ARITHMETIC UNITS
    ////////////////////////////////////////////////////////////////////////////

    add1 add1_ (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .out(add_out),
        .carry_out(add_carry_out)
    );

    sub1 sub1_ (
        .a(a),
        .b(b),
        .borrow_in(carry_in),
        .out(sub_out),
        .borrow_out(sub_borrow_out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // OUTPUT ROUTING
    ////////////////////////////////////////////////////////////////////////////

    mux8 out_mux8_ (
        {
            and_out,
            not_out,
            or_out,
            xor_out,
            add_out,
            sub_out,
            1'b0,  // transfer_out,
            1'b0  // test_out
        },
        select,
        out
    );

    mux8 carry_mux8_ (
        {1'b0, 1'b0, 1'b0, 1'b0, add_carry_out, sub_borrow_out, 1'b0, 1'b0},
        select,
        carry_out
    );

endmodule
