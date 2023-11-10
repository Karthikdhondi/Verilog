module fsm(
	input clk,
	input reset,
	input x,
	output detect
	);

reg [2:0] cur_state,next_state;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;
parameter S4 = 4;

assign detect = cur_state == S4 ? 1:0;

always @(posedge clk)
	begin
		if(reset)
			cur_state <= S0;
		else
			cur_state<=next_state;	
	end

always @ (cur_state or x)
	begin
		case (cur_state)
			S0:begin if(x)  next_state = S1;  else  next_state = S0; end
			S1:begin if(x)  next_state = S1;  else  next_state = S2; end
			S2:begin if(x)  next_state = S3;  else  next_state = S0; end
			S3:begin if(x)  next_state = S4;  else  next_state = S2; end
			S4:begin if(x)  next_state = S1;  else  next_state = S2; end
		endcase 

	end

endmodule
