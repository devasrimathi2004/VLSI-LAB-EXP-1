
module half_add(s,c,a,b);
input a,b;
output s,c;
or (s,a,b);
and (c,a,b);
endmodule
