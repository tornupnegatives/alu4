// Created by ihdl
module mux2 (
    input  a,
    input  b,
    input  select,
    output out
);

    inv1 inv1_0 (
        .a  (select),
        .out(select_n)
    );

    and2 and2_0 (
        .a  (a),
        .b  (select),
        .out(x)
    );

    and2 and2_1 (
        .a  (b),
        .b  (select_n),
        .out(y)
    );

    or2 or2_0 (
        .a  (x),
        .b  (y),
        .out(out)
    );

endmodule
