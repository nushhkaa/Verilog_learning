module blocking_assign;
    integer a,b,c,d;
    always @(*)
        repeat (4)
        begin
            #5 a = b + c;
            #5 d = a - 3;
            #5 b = d + 10;
            #5 c = c + 1;
        end
    initial 
        begin
            $monitor ($time, "    a = %4d,    b = %4d,      c = %4d,    d = %4d", a,b,c,d);
            a = 30; b = 20; c = 15; d  = 5;
            #100 $finish;
        end
endmodule
// evertime loop is executed, it is executed statement by statement 
//hence, so it is blocking assignment 
// first assignment is executed first, finishes, ani then another is executed 