`timescale 1ns / 1ps

module alu1_tb;
    logic [3:0] a;
    logic [3:0] b;
    logic carry_in;
    logic [2:0] select;
    logic [3:0] out;
    logic carry_out;

    ///////////////////////////////////////////////////////////////////////////
    // Testbench Setup
    ///////////////////////////////////////////////////////////////////////////

    localparam integer DELAY = 5;

    // Map arithemtic opcodes to {select[1:0], carry_in}
    localparam integer
        TRANSFER = 0,
        INCREMENT = 1,
        ADD = 2,
        ADD_INCREMENT = 3,
        ADD_INVERT = 4,
        SUBTRACT = 5,
        DECREMENT = 6,
        ADD_CARRY = 7;

    // Map logical opcodes to select[2:0]
    localparam integer
        AND = 4,
        OR = 5,
        XOR = 6,
        NOT = 7;

    ///////////////////////////////////////////////////////////////////////////
    // DUT Initialization
    ///////////////////////////////////////////////////////////////////////////

    alu4 DUT (.*);

    initial begin: initialize;
        a = 0;
        b = 0;
        carry_in = 0;
        select = 0;
    end: initialize

    ///////////////////////////////////////////////////////////////////////////
    // Logic Tests
    ///////////////////////////////////////////////////////////////////////////

    task automatic test_and;
        input [3:0] test_a;
        input [3:0] test_b;
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
        input [3:0] test_a;
        input [3:0] test_b;
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
        input [3:0] test_a;
        input [3:0] test_b;
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
        input [3:0] test_a;
        input [3:0] test_b;
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

    ///////////////////////////////////////////////////////////////////////////
    // Arithmetic Tests
    ///////////////////////////////////////////////////////////////////////////

    task automatic test_transfer;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, TRANSFER};

        #DELAY;

        $display("TNS:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        {carry, result} = a;

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_increment;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, INCREMENT};

        #DELAY;

        {carry, result} = a + 1;

        $display("INC:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_add;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, ADD};

        #DELAY;

        {carry, result} = a + b;

        $display("ADD:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_add_increment;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, ADD_INCREMENT};

        #DELAY;

        {carry, result} = a + b + 1;

        $display("AIC:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_add_invert;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, ADD_INVERT};

        #DELAY;

        {carry, result} = a + ~b;

        $display("AIV:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_subtract;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, SUBTRACT};

        #DELAY;

        {carry, result} = a + ~b + 1;

        $display("SUB:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_decrement;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, DECREMENT};

        #DELAY;

        {carry, result} = a - 1;

        $display("DEC:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    task automatic test_add_carry;
        input [3:0] test_a;
        input [3:0] test_b;
        logic [3:0] result;
        logic carry;

        a = test_a;
        b = test_b;
        {select, carry_in} = {1'b0, ADD_CARRY};

        #DELAY;

        {carry, result} = a + 1 + 1;

        $display("ADC:\tA=%b\tB=%b\tOUT=%b\tCARRY=%b", test_a, test_b, out,
            carry_out);

        assert (out === result)
        else $fatal(1, "FAIL");

        assert (carry_out === carry)
        else $fatal(1, "FAIL");
    endtask

    ///////////////////////////////////////////////////////////////////////////
    // Testbench Sequence
    ///////////////////////////////////////////////////////////////////////////

    initial begin: main
        $display("---- Arithemtic");

        for (integer i = 0; i < 16; i++) begin
            for (integer j = 0; j < 16; j++) begin
                    test_transfer(i, j);
                    test_increment(i, j);
                    test_add(i, j);
                    test_add_increment(i, j);
                    test_add_invert(i, j);
                    test_subtract(i, j);
                    test_decrement(i, j);
                    test_add_carry(i, j);
            end
        end

        $display("\n---- Logic Tests");

        for (integer i = 0; i < 16; i++) begin
            for (integer j = 0; j < 16; j++) begin
                for (integer k = 0; k < 2; k++) begin
                    test_and(i, j, k);
                    test_or(i, j, k);
                    test_xor(i, j, k);
                    test_not(i, j, k);
                end
            end
        end

        $finish;
    end: main
endmodule
