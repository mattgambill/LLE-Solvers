clear,clc
getDelta;
points=getTieline(v1(1,1),v1(1,2));
stages=1;
while points(2,1)>0.02
   [m b]=points_toLine(delta_x,delta_y,points(2,1),points(2,2));
   vn=whereIntersectTop(m,b);
   points=getTieline(vn(1,1),vn(1,2));
   stages=stages+1;
end
stages
cd howManyStages\