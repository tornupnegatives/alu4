// Description: 2-to-1 OR gate
// Author: Caleb Cooke

`default_nettype wire

module or2 (
    input  a,
    input  b,
    output out
);

    not (a_n, a);
    not (b_n, b);
    nand (out, a_n, b_n);

endmodule

`default_nettype none
