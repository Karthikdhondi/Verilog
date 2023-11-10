/*
Finally, develop a complete hierarchical structure with a simple full adder and D flip
flop as leaf level modules, connecting four full adders in 4-bit adder, 4 flipflops in a 4-bit
register, connecting 2 4-bit registers and 4-bit adder in the top level module fibo gen
*/

module D_FF(
    input clk,
    input reset,
    input defValue,
    input  data_in,
    output reg  data_out);

    always @(posedge clk or negedge reset)
        begin
            if(~reset)
                begin
                    data_out<=defValue;
                end
            else
                begin
                    data_out <= data_in;
                end
        end
endmodule

module simpleAdder (
    input a,b,cin,
    output s,cout
    );
assign s = a^b^cin;
assign cout = (a&b)|(b&cin)|(a&cin);

endmodule


module fibonacci
#(parameter WIDTH=4) (
    input clk,
    input reset,
    output [WIDTH:0] Fn
    );

reg [WIDTH-1:0] Fn1, Fn2;

wire c0,c1,c2;

simpleAdder add0(.a(Fn1[0]), .b(Fn2[0]), .cin(0),.s(Fn[0]),.cout(c0));
simpleAdder add1(.a(Fn1[1]), .b(Fn2[1]), .cin(c0),.s(Fn[1]),.cout(c1));
simpleAdder add2(.a(Fn1[2]), .b(Fn2[2]), .cin(c1),.s(Fn[2]),.cout(c2));
simpleAdder add3(.a(Fn1[3]), .b(Fn2[3]), .cin(c2),.s(Fn[3]),.cout(Fn[4]));


D_FF firstFF_0(.clk(clk),.reset(reset),.defValue(1), .data_in(Fn[0]), .data_out(Fn1[0]));
D_FF firstFF_1(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn[1]), .data_out(Fn1[1]));
D_FF firstFF_2(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn[2]), .data_out(Fn1[2]));
D_FF firstFF_3(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn[3]), .data_out(Fn1[3]));

D_FF secondFF_0(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn1[0]), .data_out(Fn2[0]));
D_FF secondFF_1(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn1[1]), .data_out(Fn2[1]));
D_FF secondFF_2(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn1[2]), .data_out(Fn2[2]));
D_FF secondFF_3(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn1[3]), .data_out(Fn2[3]));


endmodule
