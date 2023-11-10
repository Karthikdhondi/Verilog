module fibonacci_tb;
reg clk;
reg reset;
wire [15:0] Q1;
wire [15:0] Fibo_out;
wire Fibo_valid;
reg N_valid;
reg [2:0] N;


//fib_n DUT(.clk(clk),.N(3'b 001), .reset(reset),.Fibo_valid(Fibo_valid), .N_Fibo_num(N_Fibo_num));

fib_n DUT(.clk(clk), .reset(reset),.N(N),.N_valid(N_valid), .Q1(Q1),.Fibo_valid(Fibo_valid),.Fibo_out(Fibo_out));

always #2 clk = ~clk;

initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0);

        clk <= 0;N_valid<= 0;
        #2;

        N <= 3'b 110;
        #2;
        N_valid <= 1;
        #2;
        N_valid <= 0;

        #40;

        N <= 3'b 101;
        #2;
        N_valid <= 1;
        #2;
        N_valid <= 0;


        #100;

        $finish;
    end

endmodule
