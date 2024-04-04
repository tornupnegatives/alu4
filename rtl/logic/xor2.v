// Description: 2-to-1 XOR gate
// Author: Caleb Cooke

`default_nettype wire

module xor2 (
    input  a,
    input  b,
    output out
);

    nand (x, a, b);
    nand (y, a, x);
    nand (z, x, b);
    nand (out, y, z);

endmodule

`default_nettype none
