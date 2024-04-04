// Description: Gate-level 2-to-1 multiplexer
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module mux2 (
    input  a,
    input  b,
    input  select,
    output out
);

    not1 not1_0 (
        select,
        select_n
    );

    and2 and2_0 (
        a,
        select,
        x
    );

    and2 and2_1 (
        b,
        select_n,
        y
    );

    or2 or2_0 (
        x,
        y,
        out
    );

endmodule

`default_nettype none
