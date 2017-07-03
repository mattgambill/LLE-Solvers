clear
totalExtracted=0;
[T, points, raff, ~, ~] = solveLLE(0.2625,0.4875,533.3);

    raffKG=(points(1,:)*raff);
    raffKG(1,3)=133.3+raffKG(1,3);
    newRaff= raffKG/sum(raffKG);
   [~, points1, raff, ~, ~] = solveLLE(newRaff(1,1),newRaff(1,2),sum(raffKG));
   
 raffKG=(points(1,:)*raff);
    raffKG(1,3)=133.3+raffKG(1,3);
    newRaff1= raffKG/sum(raffKG);
   [~, points2, ~, ~, ~] = solveLLE(newRaff1(1,1),newRaff1(1,2),sum(raffKG));



%{ 
Matt Gambill 
Sepatations HW 8 
3/18/2017
 %}

figure('Name','Isopropyl Ether vs Acetic Acid')
clc,close all
%data
%a=load('AA-H2O-IE.csv')/100;
a=load('Book2.csv')/100; %Data from chemcad

figure('Name','Isopropyl Ether vs Acetic Acid','NumberTitle','off')
% Insert Labels
xlabel('Acetic Acid wt%')
ylabel('Isopropyl Ether wt%')
title('Isopropyl Ether vs Acetic Acid')
grid on

set(gca,'XTick',0:0.05:0.8,'YTick',0:0.05:1);

hold on
%Plot equilibrium curve
plot(a(:,1),a(:,3),'k-')
plot(a(:,4),a(:,6),'k-')

%Plot tie lines
%plot(linspace(0,1),linspace(1,0),'k')
for i = 2:8:length(a)
    plot([a(i,1),a(i,4)],[a(i,3),a(i,6)],'k')
end

plot([points(1,1),points(2,1)],[points(1,2) points(2,2)],'k') 
plot([points1(1,1),points1(2,1)],[points1(1,2) points1(2,2)],'k') 
plot([points2(1,1),points2(2,1)],[points2(1,2) points2(2,2)],'k') 

% Plot Points 
plot(0.2625,0.4875,'k*')
plot(points(1,1),points(1,2),'k*')
plot(points(2,1),points(2,2),'ko')

plot(newRaff(1,1),newRaff(1,2),'k*')
plot(points1(1,1),points1(1,2),'k*')
plot(points1(2,1),points1(2,2),'ko')

plot(newRaff1(1,1),newRaff1(1,2),'k*')
plot(points2(1,1),points2(1,2),'k*')
plot(points2(2,1),points2(2,2),'ko')

text(0.2625,0.4875,' \leftarrow M1')
text(newRaff(1,1),newRaff(1,2),' \leftarrow M2')
text(newRaff1(1,1),newRaff1(1,2),' \leftarrow M3')


%Output To PDF
orient('landscape')
print('Isopropyl Ether vs Acetic Acid','-dpdf','-fillpage')
% DONE!
hold off
