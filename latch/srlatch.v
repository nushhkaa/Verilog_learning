module srlatch (Q, Qbar, S, R);
    input S, R;
    output Q, Qbar;
// nand G1(Q, S, Qbar);
// nand G2(Qbar, R, Q);

assign Q = ~(R & Qbar);
assign Qbar = ~(S & Q);
endmodule