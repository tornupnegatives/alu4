// Description: Gate-level 3-to-8 binary decoder, for ALU operation selection
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module decoder8 (
    input enable,
    input [2:0] select,
    output [7:0] out
);
    and (enable_b, select[2], enable);
    not (enable_bn, enable_b);
    and (enable_a, enable_bn, enable);

    decoder4 decoder_a (
        .enable(enable_a),
        .select(select[1:0]),
        .out(out[3:0])
    );

    decoder4 decoder_b (
        .enable(enable_b),
        .select(select[1:0]),
        .out(out[7:4])
    );

endmodule

`default_nettype none
