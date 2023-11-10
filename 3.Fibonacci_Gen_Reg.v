module customRegister(
    input clk,
    input reset,
    input defValue,
    input [4:0] data_in,
    output reg [4:0] data_out);

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
module adder
#(parameter WIDTH=4) (
    input [WIDTH-1:0] A,B,
    output [WIDTH:0] S
    );
wire c0,c1,c2;
assign c0 = A[0]&B[0];
assign c1 = (A[1]&B[1]) | (B[1]&c0) | (A[1]&c0) ;
assign c2 = (A[2]&B[2]) | (B[2]&c1) | (A[2]&c1) ;

assign S[0] = A[0]^B[0];
assign S[1] = A[1]^B[1]^c0;
assign S[2] = A[2]^B[2]^c1;
assign S[3] = A[3]^B[3]^c2;
assign S[4] = (A[3]&B[3]) | (B[3]&c2) | (A[3]&c2) ;
endmodule

module fibonacci
#(parameter WIDTH=4) (
    input clk,
    input reset,
    output [WIDTH:0] Fn
    );

reg [WIDTH-1:0] Fn1, Fn2;
//assign Fn = Fn1+Fn2;
adder my_adder(.A(Fn1), .B(Fn2), .S(Fn));
customRegister ff0(.clk(clk),.reset(reset),.defValue(1), .data_in(Fn), .data_out(Fn1));
customRegister ff1(.clk(clk),.reset(reset),.defValue(0), .data_in(Fn1), .data_out(Fn2));

endmodule
