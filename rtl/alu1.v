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
    // LOGIC UNIT
    ////////////////////////////////////////////////////////////////////////////

    and2 and2_ (
        .a(a),
        .b(b),
        .y(and_out)
    );

    inv1 inv1_ (
        .a(a),
        .y(not_out)
    );

    or2 or2_ (
        .a(a),
        .b(b),
        .y(or_out)
    );

    xor2 xor2_ (
        .a(a),
        .b(b),
        .y(xor_out)
    );

    mux4 logic_unit_mux4 (
        .in({and_out, or_out, xor_out, not_out}),
        .select(select[1:0]),
        .out(logic_unit_out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // ARITHMETIC UNIT
    ////////////////////////////////////////////////////////////////////////////

    arithmetic_unit arithmetic_unit_ (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .operation(select[1:0]),
        .out(arith_unit_out),
        .carry_out(carry_out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // OUTPUT ROUTING
    ////////////////////////////////////////////////////////////////////////////

    mux2 output_mux2 (
        .a(logic_unit_out),
        .b(arith_unit_out),
        .select(select[2]),
        .out(out)
    );

endmodule
