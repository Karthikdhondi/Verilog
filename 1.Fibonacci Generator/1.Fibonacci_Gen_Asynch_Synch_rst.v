/*
Design a 4-bit Fibonacci generator with both asynchronous reset and synchronous reset
in Verilog using an adder and two registers. You can use simple assign statement to
implement the adder
*/

module fibonacci
#(parameter WIDTH=4) (
    input clk,
    input reset,
    output [WIDTH:0] Fn
    );

reg [WIDTH-1:0] Fn1, Fn2;
assign Fn = Fn1+Fn2;

always @(posedge clk or negedge reset)
    begin
        if(~reset)
            begin
                Fn1<=1;
                Fn2<=0;
            end
        else
            begin
                Fn1<=Fn;
                Fn2<=Fn1;
            end
    end
endmodule
