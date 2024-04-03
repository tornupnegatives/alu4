`timescale 1ns / 1ps

module alu_tb;
    logic [3:0] a,b,r;
    logic [2:0] s;
    logic c,v;
    alu alu0(
        .a,
        .b,
        .s,
        .r,
        .c,
        .v
    );

    task alu_test;
        input [3:0] aT,bT;
        input [2:0] sT;
        input [3:0] rT;
        input cT,vT;
        #5
        a = aT; b = bT; s = sT;
        #5
        assert((r == rT) && (c == cT) && (v == vT)) else $fatal(1,"alu0(%h,%h,%h, %h,%b,%b)",a,b,s,r,c,v);
    endtask
    
    initial
    begin
        a = 8'h0; b = 8'h0; s = 3'h0;
        #10
        $monitor("%h,%h,%h, %h,%b,%b",a,b,s,r,c,v);
        //and
        alu_test(4'h0,4'h0,3'h0,4'h0,1'h0,1'h0);
        alu_test(4'h8,4'h8,3'h0,4'h8,1'h0,1'h0);
        alu_test(4'hf,4'hf,3'h0,4'hf,1'h0,1'h0);
        alu_test(4'ha,4'h5,3'h0,4'h0,1'h0,1'h0);
        alu_test(4'ha,4'ha,3'h0,4'ha,1'h0,1'h0);
        //or
        alu_test(4'h0,4'h0,3'h1,4'h0,1'h0,1'h0);
        alu_test(4'h8,4'h8,3'h1,4'h8,1'h0,1'h0);
        alu_test(4'hf,4'hf,3'h1,4'hf,1'h0,1'h0);
        alu_test(4'ha,4'h5,3'h1,4'hf,1'h0,1'h0);
        alu_test(4'ha,4'ha,3'h1,4'ha,1'h0,1'h0);
        //xor
        alu_test(4'h0,4'h0,3'h2,4'h0,1'h0,1'h0);
        alu_test(4'h8,4'h8,3'h2,4'h0,1'h0,1'h0);
        alu_test(4'hf,4'hf,3'h2,4'h0,1'h0,1'h0);
        alu_test(4'ha,4'h5,3'h2,4'hf,1'h0,1'h0);
        alu_test(4'ha,4'ha,3'h2,4'h0,1'h0,1'h0);
        //not
        alu_test(4'ha,4'h5,3'h3,4'h5,1'h0,1'h0);
        alu_test(4'ha,4'h0,3'h3,4'h5,1'h0,1'h0);
        alu_test(4'ha,4'hf,3'h3,4'h5,1'h0,1'h0);
        alu_test(4'hf,4'h5,3'h3,4'h0,1'h0,1'h0);
        alu_test(4'h0,4'h5,3'h3,4'hf,1'h0,1'h0);
        //transfer
        alu_test(4'ha,4'h5,3'h4,4'ha,1'h0,1'h0);
        alu_test(4'ha,4'h0,3'h4,4'ha,1'h0,1'h0);
        alu_test(4'ha,4'hf,3'h4,4'ha,1'h0,1'h0);
        alu_test(4'hf,4'h5,3'h4,4'hf,1'h0,1'h0);
        alu_test(4'h0,4'h5,3'h4,4'h0,1'h0,1'h0);
        //test
        alu_test(4'h0,4'h0,3'h5,4'h1,1'h0,1'h0);
        alu_test(4'h0,4'h5,3'h5,4'h1,1'h0,1'h0);
        alu_test(4'hf,4'h5,3'h5,4'h0,1'h0,1'h0);
        alu_test(4'ha,4'h0,3'h5,4'h0,1'h0,1'h0);
        
        $display("@@@Passed");
        $finish;
    end

endmodule
