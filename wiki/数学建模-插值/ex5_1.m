% ex5_1
% 对x0，y0数据进行插值，画出曲线，并求出x-0处曲线斜率和13<=x<=15范围内y的最小值

x0=[0   3   5   7   9   11   12   13   14  15];
y0=[0  1.2  1.7  2.0  2.1  2.0  1.8  1.2   1.0  1.6];
x=0:0.1:15;
y1=interp1(x0,y0,x);                        %线性插值
y2=interp1(x0,y0,x,'nearest');              %最近项插值
y3=interp1(x0,y0,x,'spline');               %立方样条插值

pp1=csape(x0,y0);                           %三次样条插值：Lagrange边界条件
y4=fnval(pp1,x);

pp2=csape(x0,y0,'second');                  %三次样条插值：二阶导数边界条件                  
y5=fnval(pp2,x);

pp2=csape(x0,y0,'complete');                %三次样条插值：一阶导数边界条件                  
y6=fnval(pp2,x);

pp2=csape(x0,y0,'not - a - knot');          %三次样条插值：非扭结条件                  
y7=fnval(pp2,x);

pp2=csape(x0,y0,'periodic');                %三次样条插值：周期条件                  
y8=fnval(pp2,x);

[x',y1',y2',y3',y4',y5',y6',y7',y8']

subplot(2,4,1)
plot(x0,y0,'+',x,y1)
title('Piecewise linear')
subplot(2,4,2)
plot(x0,y0,'+',x,y2)
title('nearest')
subplot(2,4,3)
plot(x0,y0,'+',x,y3)
title('Spline1')
subplot(2,4,4)
plot(x0,y0,'+',x,y4)
title('Spline2')
subplot(2,4,5)
plot(x0,y0,'+',x,y5)
title('Spline3 second')
subplot(2,4,6)
plot(x0,y0,'+',x,y6)
title('Spline4 complete')
subplot(2,4,7)
plot(x0,y0,'+',x,y7)
title('Spline5 not - a - knot')
subplot(2,4,8)
plot(x0,y0,'+',x,y8)
title('Spline6 periodic')

dx=diff(x);
dy=diff(y4);
dy_dx=dy./dx;
dy_dx0=dy_dx(1)
ytemp=y4(131:151);
ymin=min(ytemp);
index=find(y4==ymin);
xmin=x(index);
[xmin,ymin]
