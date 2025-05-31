module demux1to2(in, sel, out);
input in;
input sel;
output [1:0]out;  
    assign {out[1],out[0]} = sel? {in,1'b0}:  {1'b0,in};
endmodule