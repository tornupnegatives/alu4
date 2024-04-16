// Description: Gate-level 4-to-1 multiplexer
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module mux4 (
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 0
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_0_0 (
        .a(in[0]),
        .b(in[1]),
        .select(select[0]),
        .out(col_0_0)
    );

    mux2 mux2_0_1 (
        .a(in[2]),
        .b(in[3]),
        .select(select[0]),
        .out(col_0_1)
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 1
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_1_0 (
        .a(col_0_0),
        .b(col_0_1),
        .select(select[1]),
        .out(out)
    );

endmodule

`default_nettype none
