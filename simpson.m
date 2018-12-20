function simpson(n)
h=2/n;
xk=-1:2/n:1;
%xk2 doesn't contain the point at both ends
xk2=xk;
xk2(1)=[];
xk2(end)=[];
midxk=xk+h*0.5;
S1=0;
S2=0;
for i=1:n
    S1=S1+(1/(1+25*midxk(i)^2)-0.6694+2.3055*midxk(i)^2-1.8689*midxk(i)^4)^2;
end
for i=1:n-1
    S2=S2+(1/(1+25*xk2(i)^2)-0.6694+2.3055*xk2(i)^2-1.8689*xk2(i)^4)^2;
end
a1=(1/(1+25)-0.6694+2.3055-1.8689)^2*2;
S=sqrt(h/6*(4*S1+2*S2+a1))