cd ..
xam=300/3500;
xcm=2500/3500;
points_toLine(xam,xcm,0.3,0);
[m1 b1]=points_toLine(0.02,0,xam,xcm);
v1=whereIntersectTop(m1,b1);
[m_lin1 b_lin1]=points_toLine(v1(1,1),v1(1,2),0.3,0);
[m_lin2 b_lin2]=points_toLine(0.02,0,0,1);
[delta_x delta_y]=whereIntersect(m_lin1,b_lin1,m_lin2,b_lin2)