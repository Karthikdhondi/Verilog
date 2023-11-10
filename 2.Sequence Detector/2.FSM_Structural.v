// 1011 sequence detector 
module fsm_structural(
    input clk,
    input reset,
    input x,
    output detect
    );

reg   A,B,C;
wire  D_A,D_B,D_C;

assign D_A = B & C & x;
assign D_B = (A & ~x) | (B & ~C & x) | (C & ~x);
assign D_C = (~C & x) | (~B & x);
assign detect = A & x;

always @ (posedge clk)
    begin
        if(reset)
            begin
                A <= 0;
                B <= 0;
                C <= 0;
            end
        else
            begin
                A <= D_A;
                B <= D_B;
                C <= D_C;
            end
    end

endmodule
