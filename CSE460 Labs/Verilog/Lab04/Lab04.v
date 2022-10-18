module Lab04(highway, country, X, clk, clear);
	output reg [1:0] highway, country; //2-bit output for 3 states of signal: G Y R
	input X, clk, clear;
	reg [2:0] state, next_state;
	
	//signal definition
	parameter RED=2'd0;     //00
	parameter YELLOW=2'd1; //01
	parameter GREEN=2'd2; //10
	
	//state definition
	parameter S0=3'd0; //highway GREEN, country RED
	parameter S1=3'd1; //highway YELLOW, country RED
	parameter S2=3'd2; //highway RED, country RED
	parameter S3=3'd3; //highway RED, country GREEN
	parameter S4=3'd4; //highway RED, country YELLOW
			
	always @(posedge clk)
		state=next_state;
	
	//values of highway and country signals
	always @(state)
	begin
		case(state)
			S0: begin
			highway=GREEN;
			country=RED;
			end
			S1: begin
			highway=YELLOW;
			country=RED;
			end
			S2: begin
			highway=RED;
			country=RED;
			end
			S3: begin
			highway=RED;
			country=GREEN;
			end
			S4: begin
			highway=RED;
			country=YELLOW;
			end
		endcase
	end
	
	always@(state or clear or X)
	begin
		if(clear)
		next_state=S0;
		else case(state)
			S0: if(X) next_state=S1;
				else next_state=S0;
			S1: begin
				//repeat(Y2RDELAY) @(posedge clk);
				next_state=S2;
				end
			S2: begin
				//repeat(R2GDELAY) @(posedge clk);
				next_state=S3;
				end
			S3: if(X) next_state=S3;
				else next_state=S4;
			S4: begin 
				//repeat(Y2RDELAY) @(posedge clk);
				next_state=S0;
				end
			default: next_state=S0;
			endcase
		end
endmodule
