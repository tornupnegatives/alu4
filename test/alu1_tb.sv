`timescale 1ns / 1ps

module alu1_tb;
    logic a;
    logic b;
    logic carry_in;
    logic [2:0] select;
    logic out;
    logic carry_out;

    localparam integer DELAY = 5;
    alu1 DUT (.*);

    task automatic test_and;
        input test_a;
        input test_b;

        a = test_a;
        b = test_b;
        #DELAY;

        $display("AND: A=%b\tB=%b\tOUT=%b", test_a, test_b, out);

        assert (out === a & b)
        else $fatal(1, "FAIL");
    endtask

    initial begin
        for (integer i = 0; i < 2; i++)
        for (integer j = 0; i < 2; i++) test_and(i, j);
        $finish;
    end
endmodule
