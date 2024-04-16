// Description: Gate-level 8-to-1 multiplexer
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module mux8 (
    input [7:0] in,
    input [2:0] select,
    output out
);

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 0
    ////////////////////////////////////////////////////////////////////////////

    mux4 mux4_0_0 (
        .in(in[3:0]),
        .select(select[1:0]),
        .out(col_0_0)
    );

    mux4 mux4_0_1 (
        .in(in[7:4]),
        .select(select[1:0]),
        .out(col_0_1)
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 1
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_1_0 (
        .a(col_0_0),
        .b(col_0_1),
        .select(select[2]),
        .out(out)
    );

endmodule

`default_nettype none
