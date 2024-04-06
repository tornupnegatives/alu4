`timescale 1ns / 1ps

module add1_tb;
    logic a;
    logic b;
    logic carry_in;
    logic out;
    logic carry_out;

    localparam integer DELAY = 5;

    add1 ad0 (.*);

    task automatic initialize;
        a = 0;
        b = 0;
        carry_in = 0;
    endtask

    task automatic test_adder;
        input test_a;
        input test_b;
        input test_carry_in;
        input test_out;
        input test_carry_out;

        a = test_a;
        b = test_b;
        carry_in = test_carry_in;
        #DELAY;

        assert ((test_out == out) && (carry_out == test_carry_out))
        else
            $fatal(
                1,
                "a = %b, b = %b, cin = %b, out = %b, cout = %b",
                a,
                b,
                carry_in,
                out,
                carry_out
            );
    endtask

    initial begin
        initialize();
        test_adder(0, 0, 0, 0, 0);
        test_adder(0, 0, 1, 1, 0);
        test_adder(0, 1, 0, 1, 0);
        test_adder(0, 1, 1, 0, 1);
        test_adder(1, 0, 0, 1, 0);
        test_adder(1, 0, 1, 0, 1);
        test_adder(1, 1, 0, 0, 1);
        test_adder(1, 1, 1, 1, 1);

        $display("@@@Passed");  //for tradition
        $finish;
    end
endmodule
