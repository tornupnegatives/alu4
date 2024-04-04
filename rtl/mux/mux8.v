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
        in[0],
        in[1],
        select[0],
        col_0_0
    );

    mux2 mux2_0_1 (
        in[2],
        in[3],
        select[0],
        col_0_1
    );

    mux2 mux2_0_2 (
        in[4],
        in[5],
        select[0],
        col_0_2
    );

    mux2 mux2_0_3 (
        in[6],
        in[7],
        select[0],
        col_0_3
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 1
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_1_0 (
        col_0_0,
        col_0_1,
        select[1],
        col_1_0
    );

    mux2 mux2_1_1 (
        col_0_2,
        col_0_3,
        select[1],
        col_1_1
    );

    ////////////////////////////////////////////////////////////////////////////
    // COLUMN 2
    ////////////////////////////////////////////////////////////////////////////

    mux2 mux2_2_0 (
        col_1_0,
        col_1_1,
        select[2],
        out
    );

endmodule

`default_nettype none
