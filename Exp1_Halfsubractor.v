
module half_subtractor(d,b0,a,b);
input a,b;
output d,b0;
assign d = a^b;
assign b0 = (~a)&b;
endmodule
