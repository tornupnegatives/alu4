// Description: 1-bit arithmetic unit
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module arithmetic_unit (
    input a,
    input b,
    input carry_in,
    input [1:0] operation,
    output out,
    output carry_out
);

    inv1 inv1_ (
        .a(b),
        .y(b_n)
    );

    mux4 mux4_ (
        .in({1'b0, b, b_n, 1'b1}),
        .select(operation),
        .out(adder_b)
    );

    add1 add1_ (
        .a(a),
        .b(adder_b),
        .carry_in(carry_in),
        .out(out),
        .carry_out(carry_out)
    );

endmodule

`default_nettype none
