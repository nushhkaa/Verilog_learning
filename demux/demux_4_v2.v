`include "demux_2_v2.v"
module demux1to4 (in, sel, out);
    input in;
    input [1:0]sel;
    output [3:0]out;
    wire [1:0]z;

    demux1to2 M21 (.in(in), .sel(sel[1]), .out(z[1:0]));     
    demux1to2 M22 (.in(z[0]), .sel(sel[0]), .out(out[1:0])); 
    demux1to2 M23 (.in(z[1]), .sel(sel[0]), .out(out[3:2])); 
endmodule