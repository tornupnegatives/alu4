// Description: 1-to-1 NOT gate
// Author: Caleb Cooke

`default_nettype wire

module not1 (
    input  a,
    output out
);

    not (out, a);

endmodule

`default_nettype none
