module PC_ADDER(a,b,c);

     output [31:0]  c;
     input [31:0] a,b;

     assign  c = a + b;
    
endmodule