`timescale 1ns / 1ps

module decoder8_tb;
    logic enable;
    logic [2:0] select;
    logic [7:0] out;

    localparam integer DELAY = 5;
    decoder8 DUT (.*);

    task automatic test_decoder;
        input test_enable;
        input [2:0] test_select;

        enable = test_enable;
        select = test_select;
        #DELAY;

        $display("EN=%b\tSEL=%d\tOUT=%4b", test_enable, test_select, out);

        if (enable) begin
            assert (out === 1'b1 << select)
            else $fatal(1, "FAIL");
        end else begin
            assert (out === 1'b0)
            else $fatal(1, "FAIL");
        end
    endtask

    initial begin
        for (integer i = 0; i < 8; i++) test_decoder(0, i);
        for (integer i = 0; i < 8; i++) test_decoder(1, i);
        $finish;
    end
endmodule
