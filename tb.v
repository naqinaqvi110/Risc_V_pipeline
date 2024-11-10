

module tb();
reg clk = 0,rst;


top top(
.clk(clk),
.rst(rst)
);

initial begin
$dumpfile("Single Cycle.vcd");
$dumpvars(0);
end


always 
begin
clk = ~ clk;
#50;  
        
end
    
initial
begin
rst <= 1'b0;
#150;
rst <=1'b1;
#1200;
$finish;
end
endmodule