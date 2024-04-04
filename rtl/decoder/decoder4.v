// Description: Gate-level 2-to-4 binary decoder
// Author: Joseph Bellahcen <joeclb@icloud.com>

`default_nettype wire

module decoder4 (
    input enable,
    input [1:0] select,
    output [3:0] out
);

    wire a = select[0];
    wire b = select[1];

    not (a_n, a);
    not (b_n, b);

    and (out[0], a_n, b_n, enable);
    and (out[1], a, b_n, enable);
    and (out[2], a_n, b, enable);
    and (out[3], a, b, enable);

endmodule

`default_nettype none
