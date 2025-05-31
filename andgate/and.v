module andgate (
    A, B, res);
    
    input A;
    input B;
    output res;

    assign res = A & B;

endmodule