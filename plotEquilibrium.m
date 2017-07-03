
%{ 
Matt Gambill 
Sepatations HW 8 
3/18/2017
 %}

figure('Name','Isopropyl Ether vs Acetic Acid')
clc,close all
%data
a=load('AA-H2O-IE.csv')/100;


figure('Name','Isopropyl Ether vs Acetic Acid','NumberTitle','off')
% Insert Labels
xlabel('Acetic Acid wt%')
ylabel('Isopropyl Ether wt%')
title('Isopropyl Ether vs Acetic Acid')
grid on
x=0:0.1:1;
set(gca,'XTick',0:0.025:0.50,'YTick',0:0.025:1);

hold on
%Plot equilibrium curve
plot(a(:,1),a(:,3),'k-o')
plot(a(:,4),a(:,6),'k-*')

%Plot tie lines
%plot(linspace(0,1),linspace(1,0),'k')
for i = 1:length(a)
    plot([a(i,1),a(i,4)],[a(i,3),a(i,6)],'k--')
end

 plot([points(1,1),points(2,1)],[points(1,2) points(2,2)]) 
%  plot(linspace(0,0.3),-10/3*linspace(0,0.3)+1)
% plot([0,points(2,1)],[1,points(2,2)])
 %plot(delta(1,1),delta(1,2),'*')
% Plot Points 
% plot(xq,yq,'k*')
 plot(points(1,1),points(1,2),'k*')
 plot(points(2,1),points(2,2),'ko')
 %plot(linspace(0,0.5),m1*linspace(0,0.5)+b1)
%  plot(linspace(0.02,0.1509),m*linspace(0.02,0.1509)+b)
%  text(0.1185,0.6051,' \leftarrow M (0.1185,   0.6051)')
%  text(points(1,1),points(1,2),' \leftarrow V_n')
%  text(0,1,' \leftarrow V_{n+1}')
 

% Output To PDF
 orient("landscape")
 print('Isopropyl Ether vs Acetic Acid.pdf')
 
% DONE!
hold off
