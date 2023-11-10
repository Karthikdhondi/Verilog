module FSM_tb;
reg clk,x,reset;
wire detect;

always #2 clk = ~clk;

fsm_structural DUT(.clk(clk), .reset(reset),.detect(detect),.x(x));

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
  clk<= 0;
  reset<= 1;
  x <= 0;

//  repeat(1) @ (posedge clk);
  reset <= 0;


  @(posedge clk) x <= 1;
  @(posedge clk) x <= 0;
  @(posedge clk) x <= 1;
  @(posedge clk) x <= 1;


  @(posedge clk) x <= 1;
  @(posedge clk) x <= 0;
  @(posedge clk) x <= 1;
  @(posedge clk) x <= 1;


  #500 $finish;

end

endmodule
