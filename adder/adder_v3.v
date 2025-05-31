//16-bit adder using 4-bit adders which are made using ripple carry adder 
module fulladder (X, Y, S, Cin, Cout);
    input X,Y,Cin;
    output S,Cout;
    wire s1,c1,c2;

xor g1(s1,X,Y), g2(S,s1,Cin);
and g3(c1,X,Y), g4(c2,Cin,s1);
xor g5(Cout, c1,c2);
endmodule

module adder_4_bit (X, Y, S, Cin, Cout);
    input[3:0] X, Y;
    input Cin;
    output[3:0] S;
    output Cout;
    wire[3:1]c;
    //assign {Cout,S} = X + Y + Cin;
    fulladder F0(X[0],Y[0],S[0],Cin,c[1]);
    fulladder F1(X[1],Y[1],S[1],c[1],c[2]);
    fulladder F2(X[2],Y[2],S[2],c[2],c[3]);
    fulladder F3(X[3],Y[3],S[3],c[3],Cout);
endmodule

module ALU (
    X, Y, out, sign, carry, zero, parity, overflow);
    input [15:0] X,Y;
    output [15:0]out;
    output sign, carry, zero, parity, overflow;
    wire [3:1]w;

    // assign {carry,out} = X+Y;
    adder_4_bit A0 (X[3:0],   Y[3:0],  out[3:0],  1'b0,w[1]);
    adder_4_bit A1 (X[7:4],   Y[7:4],  out[7:4],  w[1],w[2]);
    adder_4_bit A2 (X[11:8],  Y[11:8], out[11:8], w[2],w[3]);
    adder_4_bit A3 (X[15:12], Y[15:12],out[15:12],w[3],carry);

    assign sign = out[15];
    assign zero = ~|out;
    assign parity = ~^out;
    assign overflow = (X[15] & Y[15] & ~out[15]) | (~X[15] & ~Y[15] & out[15]);

endmodule