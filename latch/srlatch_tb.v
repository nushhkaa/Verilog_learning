`timescale 1ns/1ns  
`include "srlatch.v"
module latchtest;
reg S,R; wire Q,Qbar;
srlatch LAT(Q, Qbar, S, R);
//initial only gets executed once
initial begin
    $monitor ($time, "    S = %b, R= %b, Q= %b, Q'= %b", S, R, Q, Qbar);
    S = 1'b0; R = 1'b1;
#5  S = 1'b1; R = 1'b1;
#5  S = 1'b1; R = 1'b0;
#5  S = 1'b1; R = 1'b1;
#5  S = 1'b0; R = 1'b0;
#5  S = 1'b1; R = 1'b1;   
    $display("First test complete");
    $finish;
end   
endmodule