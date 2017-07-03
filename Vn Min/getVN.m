function [vn1,M,points0,points1,points]=getVN(outputConc,xa0,yan1,L0)

points0=bottom_to_top(outputConc);
points1=bottom_to_top(xa0);
points = [points1(1,:); points0(2,:)];
[m b]=points_toLine(0,1,xa0,0);

[m1 b1]=points_toLine(points(1,1),points(1,2),points(2,1),points(2,2));

lin_mat = [-m 1 b; -m1 1 b1];
sol_mat=rref(lin_mat);

M=[sol_mat(1,3),sol_mat(2,3)];
xam=sol_mat(1,3);
vn1=(L0*(xa0-xam))/(xam-yan1);
fprintf('Vn+1 is: %6.3f\n',vn1)
end