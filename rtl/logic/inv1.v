// Description: 1-to-1 NOT gate (inverter)
// Author: Caleb Cooke

`default_nettype wire

module inv1 (
    input  a,
    output y
);

    not (y, a);

endmodule

`default_nettype none
