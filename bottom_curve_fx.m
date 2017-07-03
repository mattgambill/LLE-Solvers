function [bottom_point] = bottom_curve_fx(xq)
%a=load('AA-H2O-IE-chemCad.csv')/100;
a=load('AA-H2O-IE.csv')/100;
slopes = [];
incep = [];

for i = 1:(length(a)-1)
[n, b] =points_toLine(a(i,1),a(i,3),a(i+1,1),a(i+1,3));
slopes = [slopes n];
incep = [incep b];
end

for i=1:(length(a)-1)
   if xq==a(i,1)
       row =i;
   elseif xq==a(i+1,1)
       row=i+1;
   elseif xq>a(i,1)&& xq<a(i+1,1)
       row=i;
   end
end

yq=slopes(1,row)*xq+incep(1,row);

bottom_point=[xq,yq];
end