% ex5_3
% 实现二维插值，并找出最高点的坐标和高程

clear,clc
x0=100:100:500;
y0=100:100:400;
z=[636    697    624    478   450  
   698    712    630    478   420
   680    674    598    412   400
   662    626    552    334   310];

pp=csape({x0,y0},z')                %三次样条插值
xi=100:10:500;yi=100:10:400;
cz=fnval(pp,{xi,yi});

z=interp2(x0,y0,z,xi,yi');             %线性插值

[i,j]=find(cz==max(max(cz)))        %找最高点的地址
x0=xi(i),y0=yi(j),zmax=cz(i,j)      %求最高点的坐标 

subplot(2,4,1)
contour(xi,yi,cz','ShowText','on')  %二维等高线图
subplot(2,4,2)
contour3(xi,yi,cz',100)             %三维等高线图
subplot(2,4,3)
mesh(xi,yi,cz')                     %三维网格曲面图
subplot(2,4,4)
meshz(xi,yi,cz')                    %三维网格曲面帷幕图

subplot(2,4,5)
contour(xi,yi,z,'ShowText','on')  %二维等高线图
subplot(2,4,6)
contour3(xi,yi,z,100)             %三维等高线图
subplot(2,4,7)
mesh(xi,yi,z)                     %三维网格曲面图
subplot(2,4,8)
meshz(xi,yi,z)                    %三维网格曲面帷幕图