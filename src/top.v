module top(sysclk,rstn,in1,in2,in3,in4,sel,result,carry);

input sysclk,rstn;

input [29:0] in1;
input [29:0] in2;
input [29:0] in3;
input [29:0] in4;
input [1:0]  sel;

output[31:0] result;
output       carry;

reg [30:0] a1;
reg [30:0] a2;

reg [31:0] b1;
reg [31:0] b2;



always@(posedge sysclk or negedge rstn)
begin
  if(!rstn)
     a1<=31'b0;
  else
     a1<=in1+in2;
end

always@(posedge sysclk or negedge rstn)
begin
  if(!rstn)
     a2<=31'b0;
  else
     a2<=in3+in4;
end

//*********************************************************************
always@(posedge sysclk or negedge rstn)
begin
  if(!rstn)
     b1<=32'b0;
  else
    begin
      if(sel==2'b0)
        b1<=a1+31'hffff;
      else if(sel==2'b1)
        b1<=a1+31'habcd;
    end
end

always@(posedge sysclk or negedge rstn)
begin
  if(!rstn)
     b2<=32'b0;
  else
    begin
      if(sel==2'b0)
        b2<=a2+31'hffff;
      else if(sel==2'b1)
        b2<=a2+31'habcd;
    end
end
//***********************************************************************

assign {carry,result} = b1 + b2;

endmodule
