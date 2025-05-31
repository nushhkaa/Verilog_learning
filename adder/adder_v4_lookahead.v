module adder_4_bit (X, Y, S, Cin, Cout);
    input[3:0] X, Y;
    input Cin;
    output[3:0] S;
    output Cout;

    wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3;
    //generate carry signals
    assign  g0 = X[0]&Y[0],     g1 = X[1]&Y[1],
            g2 = X[2]&Y[2],     g3 = X[3]&Y[3];
    //propagate carry signals 
    assign  p0 = X[0]^Y[0],     p1 = X[1]^Y[1],
            p2 = X[2]^Y[2],     p3 = X[3]^Y[3];
    //carry signals 
    assign c1 = g0 | (p0&Cin),
    c2 = g1 | (p1&g0) | (p1&p0&Cin),
    c3 = g2 | (p2&g1) | (p2&p1&g0) | (p2&p1&p0&Cin),
    Cout = g3 | (p3&g2) | (p3&p2&g1) | (p3&p2&p1&g0) | (p3&p2&p1&p0&Cin);
    //sum signals 
    assign S[0] = p0^Cin,   S[1] = p1^c1,   S[2] = p2^c2, S[3] = p3^c3;
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