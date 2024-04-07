// Description: Gate-level 2-to-1 multiplexer
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module mux2 (
    input  a,
    input  b,
    input  select,
    output out
);

    inv1 inv1_0 (
        .a(select),
        .y(select_n)
    );

    and2 and2_0 (
        .a(a),
        .b(select),
        .y(x)
    );

    and2 and2_1 (
        .a(b),
        .b(select_n),
        .y(y)
    );

    or2 or2_0 (
        .a(x),
        .b(y),
        .y(out)
    );

endmodule

`default_nettype none
