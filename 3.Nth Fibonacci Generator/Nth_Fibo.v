/*
Design a digital block to compute the Nth fiboncacci number (where N is the given
input number). Implement the design in Verilog and develop a simple test bench
to verify the design. Take input N to be 3-bits, allocate sufficient number of bits
for the output. Input and output busues will have qualifiers N valid and Fibo valid
respectively.
*/


module fib_n(
  input clk,
  input reset,
  input N_valid,
  input [2:0] N,
  output reg [15:0] Q1,
  output reg Fibo_valid,
  output reg [15:0] Fibo_out
);

reg  [15:0] Q0;
wire [15:0] D0;
reg [2:0] count;

assign D0 = Q0+Q1;

always @(posedge clk) begin

    if (N_valid) begin Q0 <= 1;  Q1 <= 0;  count <= 0; Fibo_valid <= 0; end
    else begin         Q0 <= D0; Q1 <= Q0; count <= count + 1; end

    if (count == N) begin  Fibo_valid <= 1;   Fibo_out <= Q1;  end
    else   begin           Fibo_valid <= 0;   Fibo_out <= 0;   end

end
endmodule
/*

always @(posedge clk or posedge reset) begin
  if (reset) begin
    Q0 <= 1; Q1 <= 0;
    end
  else begin
    Q0 <= D0; Q1 <= Q0;
    end
end
endmodule
*/
