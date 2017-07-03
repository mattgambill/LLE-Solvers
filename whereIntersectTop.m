%at what point an arbitrary line tha passes through the top of the 
%equilbrium curve
function [output] = whereIntersectTop(m,b)
a=load('AA-H2O-IE.csv')/100;
slopes = [];
incep = [];

for i = 1:(length(a)-1)
[n, o] =points_toLine(a(i,4),a(i,6),a(i+1,4),a(i+1,6));
slopes = [slopes n];
incep = [incep o];
end

for i=1:length(slopes)
    x_l=a(i,4);
    x_r=a(i+1,4);
    x_test=(-incep(1,i)+b)/(slopes(1,i)-m);
  if x_test >= x_l && x_test < x_r
      row=i;   
  end
end


lin_mat=[-slopes(1,row) 1 incep(1,row);-m 1 b];
sol_mat=rref(lin_mat);
output=[sol_mat(1,3),sol_mat(2,3)];
end