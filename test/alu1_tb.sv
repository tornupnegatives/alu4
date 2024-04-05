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

        $display("AND:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

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

        $display("OR:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

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

        $display("XOR:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

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

        $display("NOT:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

        assert (out === ~a)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_add;
        input test_a;
        input test_b;
        input test_carry;
        logic result;
        logic carry;

        a = test_a;
        b = test_b;
        carry_in = test_carry;
        {carry, result} = test_a + test_b + test_carry;
        select = ADD;

        #DELAY;

        $display("ADD:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_sub;
        input test_a;
        input test_b;
        input test_borrow;
        logic result;
        logic borrow;

        a = test_a;
        b = test_b;
        carry_in = test_borrow;
        {borrow, result} = test_a - test_b - test_borrow;
        select = SUB;

        #DELAY;

        $display("SUB:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_borrow, out, carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === borrow)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_transfer;
        input test_a;
        input test_b;
        input test_carry;

        select = TRANSFER;
        #DELAY;

        $display("TNS:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

        assert (out === test_a)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_test;
        input test_a;
        input test_b;
        input test_carry;

        select = TEST;
        #DELAY;

        $display("TST:\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b", test_a, test_b,
                 test_carry, out, carry_out);

        assert (out === (test_a == test_b))
        else $fatal(1, "FAIL");
    endtask

    initial begin
        initialize();

        for (integer i = 0; i < 2; i++) begin
            for (integer j = 0; j < 2; j++) begin
                for (integer k = 0; k < 2; k++) begin
                    test_and(i, j, k);
                    test_or(i, j, k);
                    test_xor(i, j, k);
                    test_not(i, j, k);
                    test_add(i, j, k);
                    test_sub(i, j, k);
                    test_transfer(i, j, k);
                    test_test(i, j, k);
                end
            end
        end

        $finish;
    end
endmodule
