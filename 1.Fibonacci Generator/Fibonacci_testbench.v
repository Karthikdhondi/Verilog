module fibonacci_tb;
reg clk;
reg reset;
wire [4:0] Fn;

fibonacci DUT(.clk(clk), .reset(reset), .Fn(Fn));

always #2 clk = ~clk;

initial 
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
        clk = 0;
        reset = 0;
        #10
        reset = 1;
        #100
        $finish;
    end

endmodule
