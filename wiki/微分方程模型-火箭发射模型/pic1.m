clc,clear
n=2;
hold on
while n<100
    k = (0.9*exp(3.5/n))/(1-0.1*exp(3.5/n));
    y = k^n;
    plot(n,y,'*k')
    n=n+1;
end
xlabel('n'),ylabel('{m_0}/{m_p}')
