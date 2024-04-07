// Description: 2-to-1 XOR gate
// Author: Caleb Cooke

`default_nettype wire

module xor2 (
    input  a,
    input  b,
    output y
);

    nand (stage_1, a, b);
    nand (stage_2, a, stage_1);
    nand (stage_3, stage_1, b);
    nand (y, stage_2, stage_3);

endmodule

`default_nettype none
