module mux2to1 (in1, in0, S, F);
    inout in1,in0,S;
    output reg F;
always @(in1 or in0 or S) begin // (in1, in0, S) is also useable also always@(*)
    if (S)
    F = in1;
    else 
    F = in0;
end
endmodule