function [x,y] = whereIntersect(m1,b1,m2,b2)
x=(b2-b1)/(m1-m2);
y=m1*x+b1;
end