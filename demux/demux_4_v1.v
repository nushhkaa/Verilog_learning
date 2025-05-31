module demux1to4 (in, sel, out);
    input in;
    input [1:0]sel;
    output reg [3:0]out;
always @(*) begin
    case (sel)
        2'h0:out = {1'b0,1'b0,1'b0,in};
        2'h1:out = {1'b0,1'b0,in,1'b0};
        2'h2:out = {1'b0,in,1'b0,1'b0};
        2'h3:out = {in,1'b0,1'b0,1'b0};
        default:out = {1'b0,1'b0,1'b0,1'b0};
    endcase
end
endmodule