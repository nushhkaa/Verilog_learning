//here, even mux2to1 is modeled structurally
module mux2to1 (in, sel, out);
input [1:0]in;
input sel;
output out;
wire t1,t2,t3;
 
not G1 (t1,sel);
and G2 (t2,in[0],t1);
and G3 (t3,in[1],sel);
or G4 (out,t2,t3);
endmodule

module mux4to1 (in, sel, out);
input [3:0]in;
input [1:0]sel;
wire [1:0]t;
output out;
    mux2to1 m20 (in[1:0], sel[0],t[0]);
    mux2to1 m21 (in[3:2], sel[0],t[1]);

    mux2to1 m22 (t, sel[1],out);

endmodule

module mux16to1 (in, sel, out);
    input [15:0]in;
    input [3:0]sel;
    output out;
    wire [3:0]t;

    mux4to1 m40 (in[3:0], sel[1:0],t[0]);
    mux4to1 m41 (in[7:4], sel[1:0],t[1]);
    mux4to1 m42 (in[11:8], sel[1:0],t[2]);
    mux4to1 m43 (in[15:12], sel[1:0],t[3]);

    mux4to1 m44 (t, sel[3:2],out);
endmodule