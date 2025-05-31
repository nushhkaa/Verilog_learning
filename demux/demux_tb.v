`timescale 10ns/1ns 
`include "demux_4_v2.v"
//C:\iverilog\gtkwave\bin\gtkwave.exe
module demuxtest;
    reg in;
    reg [1:0]sel;
    wire [3:0]out;

    demux1to4 M (.in(in), .sel(sel), .out(out));

    initial begin
        $monitor ($time, "    in = %b, s= %b, y = %b ", in, sel, out );
//time will show time variable, 
//monitor will print only when state changes 
        in = 1'b1;  sel= 2'h0; #5 
        in = 1'b1;  sel= 2'h1; #5 
        in = 1'b1;  sel= 2'h2; #5 
        in = 1'b1;  sel= 2'h3; #5 
        in = 1'b0;  sel= 2'h1; #5 
        in = 1'b0;  sel= 2'h2; #5 
        $finish;
    end 
endmodule