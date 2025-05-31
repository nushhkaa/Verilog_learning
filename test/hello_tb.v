`timescale 1ns/1ns //idk 
`include "test.v"
//C:\iverilog\gtkwave\bin\gtkwave.exe
module hello_tb;

reg A;
wire B;

hello uut(
    .A(A),
    .B(B));

initial begin
    $display("First test started");
    $dumpfile("hello_tb.vcd");
    $dumpvars(0,hello_tb);

    A = 0;
    #20;

    A = 1;
    #20;

    A = 0;
    #20;

    $display("First test complete");
    $finish;
end

endmodule