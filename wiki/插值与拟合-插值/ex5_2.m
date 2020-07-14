% ex5_2
% 对x0，y0数据进行插值，画出曲线，并求出区间积分

clc, clear
x0=0.15:0.01:0.18;
y0=[3.5	1.5	2.5	2.8];
x=0.15:0.001:0.18;
pp=csape(x0,y0)   %默认的边界条件，Lagrange边界条件
y1=fnval(pp,x);
format long g
xishu=pp.coefs   %显示每个区间上三次多项式的系数
s=integral(@(t)ppval(pp,t),0.15,0.18)  %求积分
format  %恢复短小数的显示格式

scatter(x0,y0);
hold on
plot(x,y1)
hold off
grid on
title('v(t)-t三次样条插值')
xlabel('t');
ylabel('v(t)');