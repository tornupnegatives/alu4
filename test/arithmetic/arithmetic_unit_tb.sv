`timescale 1ns / 1ps

module arithmetic_unit_tb;
    logic a;
    logic b;
    logic carry_in;
    logic [1:0] operation;
    logic out;
    logic carry_out;

    localparam integer DELAY = 5;

    arithmetic_unit DUT (.*);

    task automatic initialize;
        a = 0;
        b = 0;
        carry_in = 0;
        operation = 0;
    endtask

    task automatic test_arithmetic;
        input test_a;
        input test_b;
        input test_carry;
        input test_select;
        logic result;
        logic carry;

        logic [2:0] test_operation = {carry_in, test_select};

        a = test_a;
        b = test_b;
        {operation, carry_in} = test_operation;

        #DELAY;

        $display("ARITH:\tOP=%b\tA=%b\tB=%b\tC=%b\tOUT=%b\tCARRY=%b",
                 test_operation, test_a, test_b, test_carry, out, carry_out);

        case (test_operation)
            // Y = A
            3'd0: begin
                result = test_a;
                carry  = 1'b0;
            end

            // Y = A + 1
            3'd1: begin
                {carry, result} = test_a + 1;
            end

            // Y = A + B
            3'd2: begin
                {carry, result} = test_a + test_b;
            end

            // Y = A + B + 1
            3'd3: begin
                {carry, result} = test_a + test_b + 1'b1;
            end

            // Y = A + ~B
            3'd4: begin
                {carry, result} = test_a + ~test_b;
            end

            // Y = A + ~B + 1 = A - B
            3'd5: begin
                {carry, result} = test_a - test_b;
            end

            // Y = A + 1 = A - 1
            3'd6: begin
                {carry, result} = test_a - 1'b1;
            end

            // Y = A + 1 + 1 = A
            3'd7: begin
                {carry, result} = test_a + 1'b1 + 1'b1;
            end

            default: begin
                $fatal(1, "Undefined operation: %b", test_operation);
            end
        endcase

        assert (out === result)
        else $fatal(1, "FAIL: Incorrect result");

        assert (carry_out === carry)
        else $fatal(1, "FAIL: Incorrect carry");
    endtask

    initial begin
        initialize();

        for (integer i = 0; i < 8; i++) begin
            for (integer j = 0; j < 2; j++) begin
                for (integer k = 0; k < 2; k++) begin
                    test_arithmetic(j, k, i[0], i[2:1]);
                end
            end
        end

        $finish;
    end
endmodule
