module para_counter (clear, clock, count);
input clear, clock;
parameter N = 7
output [0:N]count;
reg [0:N]count;//always need to declare reg to use in LHS assignment

always @(negedge clk )//clear is active low
//if clear = 0, then the hardware gets cleared 
begin
    if (clear)
    count <= 0;
    else
    count <= count+1;
end
endmodule
//behavioral model 