// Description: 2-to-1 AND gate
// Author: Caleb Cooke

`default_nettype wire

module and2 (
    input  a,
    input  b,
    output out
);

    and (out, a, b);

endmodule

`default_nettype none
