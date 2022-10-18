module LabHW1(F, S0, S1, S2, S3, S4, S5, S6, S7, W0, W1, W2);
	input S0, S1, S2, S3, S4, S5, S6, S7, W0, W1, W2;
	output F;
	wire Y1, Y2, Y3, Y4;
	
	mux2to1 first (Y1, S0, S1, W2);
	mux2to1 second (Y2, S2, S3, W2);
	mux2to1 third (Y3, S4, S5, W2);
	mux2to1 fourth (Y4, S6, S7, W2);
	
	mux4to1 final_output (F, Y1, Y2, Y3, Y4, W0, W1);
	
endmodule


module mux2to1(Y, S0, S1, W); 

    input S0, S1, W; 
    output reg Y; 

    always @(S0, S1, W) 
    begin 
	if(W == 0) 
	    Y = S0; 
	else 
	    Y = S1; 
    end 

endmodule


module mux4to1(F, S0, S1, S2, S3, W0, W1); 

    input S0, S1, S2, S3, W0, W1; 
    output reg F; 

    always @(S0, S1, S2, S3, W0, W1) 
    begin 
	if(W0 == 0 && W1 == 0) 
		F = S0; 
	else if (W0 == 0 && W1 == 1)
		F = S1;
	else if (W0 == 1 && W1 == 0)
		F = S2; 
	else
		F = S3;
    end 

endmodule
