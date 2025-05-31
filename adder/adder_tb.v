`timescale 10ns/1ns 
`include "adder_v4_lookahead.v"
//C:\iverilog\gtkwave\bin\gtkwave.exe
module ALUtest;
    reg [15:0] n1,n2;
    wire [15:0]out;
    wire S, C, Z, P, V;

    ALU  one(.X(n1), .Y(n2), .out(out), .sign(S), .carry(C), .zero(Z), .parity(P), .overflow(V));

    initial begin
        $monitor ($time, "    n1 = %b  =%h, n2= %b  =%h, output = %b  =%h,  C = %b,  S = %b,  Z = %b,  P = %b,  V = %b  ", n1,n1,n2,n2,out,out,C,S,Z,P,V );
//time will show time variable, 
//monitor will print only when state changes 
        n1 = 16'h62E0;   n2 = 16'hE2E0; #5 
        n1 = 16'h2125;   n2 = 16'hA195; #5 
        n1 = 16'hFFFF;   n2 = 16'hFFFF; #5 
        n1 = 16'h8000;   n2 = 16'h8FFF; #5 
        $finish;
    end 
endmodule