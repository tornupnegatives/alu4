`timescale 1ns / 1ps

module add1_tb;

    logic a, b, carry_in, out, carry_out;
    
    add1 ad0(
        .a,
        .b,
        .carry_in,
        .out,
        .carry_out
    );
    
    task AdderTest;
        input aT,bT,carry_inT, outT,carry_outT;
        
        a = aT; b = bT; carry_in = carry_inT;
        #10
        assert((outT == out) && (carry_out == carry_outT)) else $fatal(1,"a = %b, b = %b, cin = %b, out = %b, cout = %b",a,b,carry_in, out,carry_out);
    endtask
    
    initial
    begin
        AdderTest(0,0,0,0,0);
        AdderTest(0,0,1,1,0);
        AdderTest(0,1,0,1,0);
        AdderTest(0,1,1,0,1);
        AdderTest(1,0,0,1,0);
        AdderTest(1,0,1,0,1);
        AdderTest(1,1,0,0,1);
        AdderTest(1,1,1,1,1);
        $display("@@@Passed"); //for tradition
        $finish;
    end
endmodule
