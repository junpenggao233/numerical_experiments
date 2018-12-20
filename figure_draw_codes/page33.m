function page33
J=[10;11;12;13;14;15;16;18;20;26;30;40;60;80];
%because from the graph it is difficult to generate the compeletely concise
%parameters of J or delta_x, so I use the same parameters of page31 of J
delta_x=1./J;
%A:theta=0,miu=1/2
delta_tA=0.5*delta_x.^2;
k1=1./(delta_x.*delta_tA);
error1=[];
for i =1:size(J,1)
    error1=[error1 log10(thetacomputing(0,J(i),0.5,0))];
end
semilogx(k1,error1,'-ok')
%B1:theta=1/2 miu=1/2
hold on 
delta_tB=0.5*delta_x.^2;
k2=1./(delta_x.*delta_tB);
error2=[];
for i =1:size(J,1)
    error2=[error2 log10(thetacomputing(0.5,J(i),0.5,0))];
end
semilogx(k2,error2,'-xk')
%B2: theta1/2 v=1/20
delta_tB2=0.05*delta_x;
k4=1./(delta_x.*delta_tB2);
error4=[];
for i =1:size(J,1)
    error4=[error4 log10(thetacomputing(0.5,J(i),0,0.05))];
end
semilogx(k4,error4,':xk')
%C1: theta=1/2 miu=5
error3=[];
delta_tC1=5*delta_x.^2;
k3=1./(delta_x.*delta_tC1);
for i =1:size(J,1)
    error3=[error3 log10(thetacomputing(0.5,J(i),5,0))];
end
semilogx(k3,error3,'-+k')
%C2:theta=1/2 v=1/2
error5=[];
delta_tC2=0.5*delta_x;
k5=1./(delta_x.*delta_tC2);
for i =1:size(J,1)
    error5=[error5 log10(thetacomputing(0.5,J(i),0,0.5))];
end
semilogx(k5,error5,':+k')
%D1:theta=1 miu=5
error6=[];
delta_tD1=5*delta_x.^2;
k6=1./(delta_x.*delta_tD1);
for i =1:size(J,1)
    error6=[error6 log10(thetacomputing(1,J(i),5,0))];
end
semilogx(k6,error6,'-*k')
ylabel('log_{10}E^{n}')
xlabel('1/(\delta_{t}*\delta_{x})')
%D2:theta=1 v=0.5
error7=[];
delta_tD2=0.5*delta_x;
k7=1./(delta_x.*delta_tD2);
for i =1:size(J,1)
    error7=[error7 log10(thetacomputing(1,J(i),0,0.5))];
end
semilogx(k7,error7,'--*k')