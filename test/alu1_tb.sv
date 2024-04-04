`timescale 1ns / 1ps

module alu1_tb;
    logic a;
    logic b;
    logic carry_in;
    logic [2:0] select;
    logic out;
    logic carry_out;

    localparam integer DELAY = 5;

    localparam integer AND = 0;
    localparam integer NOT = 1;
    localparam integer OR = 2;
    localparam integer XOR = 3;
    localparam integer ADD = 4;
    localparam integer SUB = 5;
    localparam integer TRANSFER = 6;
    localparam integer TEST = 7;

    alu1 DUT (.*);

    task automatic initialize;
        a = 0;
        b = 0;
        carry_in = 0;
        select = 0;
    endtask

    task automatic test_and;
        input test_a;
        input test_b;
        input test_carry;

        a = test_a;
        b = test_b;
        carry_in = test_carry;
        select = AND;

        #DELAY;

        $display("AND: A=%b\tB=%b\tC=%b\tOUT=%b", test_a, test_b, test_carry,
                 out);

        assert (out === (a & b))
        else $fatal(1, "FAIL");
    endtask

    task automatic test_or;
        input test_a;
        input test_b;
        input test_carry;

        a = test_a;
        b = test_b;
        carry_in = test_carry;
        select = OR;

        #DELAY;

        $display("OR: A=%b\tB=%b\tC=%b\tOUT=%b", test_a, test_b, test_carry,
                 out);

        assert (out === (a | b))
        else $fatal(1, "FAIL");
    endtask

    task automatic test_xor;
        input test_a;
        input test_b;
        input test_carry;

        a = test_a;
        b = test_b;
        carry_in = test_carry;
        select = XOR;

        #DELAY;

        $display("XOR: A=%b\tB=%b\tC=%b\tOUT=%b", test_a, test_b, test_carry,
                 out);

        assert (out === (a ^ b))
        else $fatal(1, "FAIL");
    endtask

    task automatic test_not;
        input test_a;
        input test_b;
        input test_carry;

        a = test_a;
        b = test_b;
        carry_in = test_carry;
        select = NOT;

        #DELAY;

        $display("NOT: A=%b\tB=%b\tC=%b\tOUT=%b", test_a, test_b, test_carry,
                 out);

        assert (out === ~a)
        else $fatal(1, "FAIL");
    endtask

    initial begin
        initialize();

        for (integer i = 0; i < 2; i++)
        for (integer j = 0; j < 2; j++)
        for (integer k = 0; k < 2; k++) test_and(i, j, k);
        $display();

        for (integer i = 0; i < 2; i++)
        for (integer j = 0; j < 2; j++)
        for (integer k = 0; k < 2; k++) test_or(i, j, k);
        $display();

        for (integer i = 0; i < 2; i++)
        for (integer j = 0; j < 2; j++)
        for (integer k = 0; k < 2; k++) test_xor(i, j, k);
        $display();

        for (integer i = 0; i < 2; i++)
        for (integer j = 0; j < 2; j++)
        for (integer k = 0; k < 2; k++) test_not(i, j, k);

        $finish;
    end
endmodule
