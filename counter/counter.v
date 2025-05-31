module simple_counter (clk, rst, count);
input clk, rst;
output [31:0]count;
reg [31:0]count;//always need to declare reg to use in LHS assignment

always @(posedge clk or posedge rst)//rst is active low
begin
    if (rst)
    count = 32'b0;
    else
    count = count+1;
end
endmodule