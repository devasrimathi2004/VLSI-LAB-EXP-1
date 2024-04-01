module full_subtractor(a,b,c,d,bout);
input a,b,c;
output d,bout;
assign d = a^b^c;
assign bout = (~a&b) | (~(a^b)&c);
endmodule
