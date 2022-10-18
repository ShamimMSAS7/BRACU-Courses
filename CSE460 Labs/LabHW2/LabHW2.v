module LabHW2(w,clk,resetn,z);

input w, clk, resetn;
output z;

reg [1:0] y, Y;

parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
 
always @(w, y)
begin
    case(y)
        A:  if (w) Y = B;
            else Y = A;   
        B:  if (w) Y = B;
            else Y = C;  
        C:  if (w) Y = D;
            else Y = A;   
        D:  if (w) Y = B;
            else Y = C;
            
        default: Y = 2'bxx;
    endcase
end 

always @(negedge resetn, posedge clk)
    if(resetn == 0) y <= A;
    else y <= Y;

assign z = (y==D);

endmodule