module Lab1(f, x1, x2, x3);
	input x1, x2, x3;
	output f;
	//Behavioral representation
	assign f = (x1 & x2) | (~x2 & x3);
endmodule
