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

    mux2 mux2_0_2 (
        .a(in[4]),
        .b(in[5]),
        .select(select[0]),
        .out(col_0_2)
    );

    mux2 mux2_0_3 (
        .a(in[6]),
        .b(in[7]),
        .select(select[0]),
        .out(col_0_3)
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 1
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_1_0 (
        .a(col_0_0),
        .b(col_0_1),
        .select(select[1]),
        .out(col_1_0)
    );

    mux2 mux2_1_1 (
        .a(col_0_2),
        .b(col_0_3),
        .select(select[1]),
        .out(col_1_1)
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 2
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_2_0 (
        .a(col_1_0),
        .b(col_1_1),
        .select(select[2]),
        .out(out)
    );

endmodule

`default_nettype none
