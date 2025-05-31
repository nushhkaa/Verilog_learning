module demux1to2(in, sel, out);
input in;
input sel;
output [1:0]out;  
wire t1;
not gate1 (t1, sel);
and gate2 (out[0], t1, in);
and gate3 (out[1], sel, in);
endmodule