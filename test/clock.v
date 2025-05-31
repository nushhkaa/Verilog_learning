`timescale 1ns/1ns
module generate_clock ;
    output reg clock;

    initial 
    clk = 1'b0;
    always 
    #5 clk = -clk; //toggle after 5 unit of time

    initial 
    #500 $finish;
endmodule