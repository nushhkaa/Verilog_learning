`timescale 1ns/1ns //idk 
`include "and.v"

module andgate_tb;

reg A;
reg B;
wire res;

andgate uut(A,B,res);

initial begin
    $dumpfile("andgate_tb.vcd");
    $dumpvars(0,andgate_tb);

    A = 0;
    B = 0;
    #20;

    A = 0;
    B = 1;
    #20;

    A = 1;
    B = 0;
    #20;

    A = 1;
    B = 1;
    #20;

    $display("AND test complete");
    $finish;
end
endmodule