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
    // DECODER
    ////////////////////////////////////////////////////////////////////////////

    // | SELECT | OPERATION |
    // |--------|-----------|
    // | 000    | AND       |
    // | 001    | NOT       |
    // | 010    | OR        |
    // | 011    | XOR       |
    // | 100    | ADD       |
    // | 101    | SUB*      |
    // | 110    | TRANSFER* |
    // | 111    | TEST*     |

    decoder8 decoder8_ (
        .enable(1'b1),
        .select(select),
        .out({
            select_and,
            select_not,
            select_or,
            select_xor,
            select_add,
            select_sub,
            select_transfer,
            select_test
        })
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
        .carry_out(carry_out)
    );

    ////////////////////////////////////////////////////////////////////////////
    // OUTPUT ROUTING
    ////////////////////////////////////////////////////////////////////////////

    and (route_and, select_and, and_out);
    and (route_not, select_not, and_not);
    and (route_or, select_or, or_out);
    and (route_xor, select_xor, and_xor);
    and (route_add, select_add, and_add);
    
    // and (route_sub, select_sub, and_sub);
    // and (route_transfer, select_transfer, and_transfer);
    // and (route_test, select_test, and_test);
    assign route_sub = 1;
    assign route_transfer = 1;
    assign route_test = 1;

    xor (
        out,
        route_and,
        route_not,
        route_or,
        route_xor,
        route_add,
        route_sub,
        route_transfer,
        route_test
    );

endmodule
