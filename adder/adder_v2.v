module adder_4_bit (X, Y, S, Cin, Cout);
    input[3:0] X, Y;
    input Cin;
    output[3:0] S;
    output Cout;
    assign {Cout,S} = X + Y + Cin;
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