%{
Matt Gambill
Separations HW 10
3/22/2017
This function solves a single stage LLE problem.
Inputs are the acetic acid weight fraction (xq), Isopropyl ether
weight fraction (yq) and M the total amount of mass after mixing.
This function currently is made with equilibrium data for acetic acid
isopropyl ether and water system but can be changed for other systems
by changing any occurance of acetic acid, water and isopropyl ether to what
your new LLE system is.

Data columns MUST be in the following format:
Species transfering between phases, Inorganic Solvent, Organic Solvent...
See example data in Geankoplis A.3 for acetic acid,water and IE for column
format.
%}
function [T, points, raff, extract, percentRecovery] = solveLLE(xq,yq,M)
%% Declare Variables
a=load('AA-H2O-IE.csv')/100; %A.3 Data
%a=load('Book2.csv')/100; %Data from chemcad
j=0;
slopes = [];
incep = [];
isIn = [];



%% Get Tie Line Equations
for i = 2:length(a)
[m, b] =points_toLine(a(i,1),a(i,3),a(i,4),a(i,6));
slopes = [slopes m];
incep = [incep b];
end

%% Check To see if User's Point is On a Tieline
%{ 
This part will check if the mix point is on a tieline defined by the
equilibrium data.
%}

o=slopes*xq+incep==yq;
for i = 1:length(o)
if o(1,i) == 1
j=i;
end
end

%% Start Interpolation Sequence
if j==0
%{
    We first find where our mix point is in relation to the equilibium data.
    This is done by taking two tielines and the equilibrium curve and forming
    a quadrilateral that can be tested by the matlab function 'inpolygon'
    to see if the mix point lies inbetween those two tielines. The second
    for loop in this section returns the k'th row where the point will lie
    between row k and k+1.
%}   
    
for k = 1:(length(a)-1)
xv = [a(k,4),a(k+1,4),a(k+1,1),a(k,1) a(k,4)];
yv = [a(k,6) a(k+1,6) a(k+1,3) a(k,3) a(k,6)];
in = inpolygon(xq,yq,xv,yv);
isIn = [isIn in];
end

for i = 1:length(isIn)
if isIn(1,i) == 1
row=i;
end
end

%% Get Points by 'Interpolation'
%{ 
This part takes the mean of the slopes of the tielines adjacent to
the mix point and gets a line with that mean slope that passes through the
mix point.
It ten finds the intersection points of the new tieline and the equilibrium
curve.
%}

[m0, b0] = points_toLine((yq-incep(1,row-1))/(slopes(1,row-1)),slopes(1,row-1),(yq-incep(1,row))/(slopes(1,row)),slopes(1,row));
%mf=mean([m0 m1]);
mf = m0*xq+b0;
bf =pointSlope(xq,yq,mf);

% Get top intersection
[m_top, b_top]=points_toLine(a(row,4),a(row,6),a(row+1,4),a(row+1,6));

top_intersect = [-m_top 1 b_top; -mf 1 bf];
rref(top_intersect);
top_point_mat=rref(top_intersect);
top_point=[top_point_mat(1,3),top_point_mat(2,3)];

% Get bottom intersection
[m_bottom, b_bottom]=points_toLine(a(row,1),a(row,3),a(row+1,1),a(row+1,3));

bottom_intersect = [-m_bottom 1 b_bottom; -mf 1 bf];
rref(bottom_intersect);
bottom_point_mat=rref(bottom_intersect);
bottom_point=[bottom_point_mat(1,3),bottom_point_mat(2,3)];
points = [top_point; bottom_point];


else
%{ 
If our point was on a tieline defined by the data this is where the
intersection points are stored.
%}
points = [a(j+1,1) a(j+1,3); a(j+1,4) a(j+1,6)];
end
%% Final Math and Report Outputs
water = (1-sum(points'))';
points = [points water];
u=rref([[points(:,1) points(:,2)]' [xq*M; M*yq]]);
raff = u(1,3);
extract = u(2,3);
Acetic_Acid=points(:,1);
Isopropyl_Ether = points(:,2);
%T=table(Acetic_Acid,Isopropyl_Ether,water,'Rownames',{'Raffinate','Extract'});
T=0
percentRecovery = (points(2,1)*extract/(xq*M))*100; 
% reports percent recovery as a percentage NOT a fraction. if output is 87 then it it 87%

end