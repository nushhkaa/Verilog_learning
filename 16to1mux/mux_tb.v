`timescale 10ns/1ns 
`include "mux_16_v4.v"
//C:\iverilog\gtkwave\bin\gtkwave.exe
module muxtest;
    reg[15:0]A;
    reg[3:0]S;
    wire F;

    mux16to1 M (.in(A), .sel(S), .out(F));

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0,muxtest);
        $monitor ($time, "    A = %h, S= %h, F = %b", A,S,F);
//time will show time variable, and we will print values of a is hex, S is hex, s is bin
//monitor will print only when state changes 
//3 f 0 a = 0011 1111 0000 1010
        #5 A = 16'h3f0a; S = 4'h0; //1 = 0000 F = 0 
        #5 S = 4'h1; //1 = 0001 F=1
        #5 S = 4'h6; //F=0
        #5 S = 4'hC; //F=1
        #5 $finish;
    end 
endmodule