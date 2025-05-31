// module decoder_generate (
//     out, in, sel);
// input in;
// output [3:0] out;
// input [1:0] sel;

// assign out[sel] = in;
// endmodule

module latch (D, Q, En);
    input D, En;
    output Q;
    assign Q = En ? D: Q;
endmodule