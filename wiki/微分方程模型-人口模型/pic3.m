%美国人口预测%
clc,clear
a = textread('data4.txt');
y = a([2:2:6],:)';
y = nonzeros(y);
t = [1790:10:2000]';

x0 = y(1);
t0 = t(1);
xm1 = 342.4382; xm2 = 373.5135; xm3 = 294.3860;
r1 = 0.0274; r2 = 0.0247; r3 = 0.0325;

fplot(@(x) xm1/(1+((xm1/x0)-1).*exp(-r1.*(x-t0))),[1790,2020],'Linewidth',2);
hold on
fplot(@(x) xm2/(1+((xm2/x0)-1).*exp(-r2.*(x-t0))),[1790,2020],'--or');
fplot(@(x) xm3/(1+((xm3/x0)-1).*exp(-r3.*(x-t0))),[1790,2020],'-.*c');
scatter(t,y)
hold off

grid on
title('1790-2020美国人口预测')
xlabel('年份');
ylabel('人口（百万人）');