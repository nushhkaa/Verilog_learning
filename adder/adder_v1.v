module ALU (
    X, Y, out, sign, carry, zero, parity, overflow);
    input [15:0] X,Y;
    output [15:0]out;
    output sign, carry, zero, parity, overflow;

    assign {carry,out} = X+Y;
    assign sign = out[15];
    assign zero = ~|out;
    assign parity = ~^out;
    assign overflow = (X[15] & Y[15] & ~out[15]) | (~X[15] & ~Y[15] & out[15]);

endmodule