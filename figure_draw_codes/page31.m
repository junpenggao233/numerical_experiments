function page31
%first put all possible J value into a vector to conviently get them
J=[10;11;12;13;14;15;16;18;20;26;30;40;60;80];

%A:theta=0,miu=1/2
error1=[];
for i =1:size(J,1)
    error1=[error1 log10(thetacomputing(0,J(i),0.5,0))];
end

semilogx(J,error1,'-ok')
hold on

%B1:theta=1/2 miu=1/2

error2=[];
for i =1:size(J,1)
    error2=[error2 log10(thetacomputing(0.5,J(i),0.5,0))];
end
semilogx(J,error2,'-xk')
%B2: theta1/2 v=1/20
error4=[];
for i =1:size(J,1)
    error4=[error4 log10(thetacomputing(0.5,J(i),0,0.05))];
end
semilogx(J,error4,':xk')
%C1: theta=1/2 miu=5
error3=[];
for i =1:size(J,1)
    error3=[error3 log10(thetacomputing(0.5,J(i),5,0))];
end
semilogx(J,error3,'-+k')

%C2:theta=1/2 v=1/2
error5=[];
for i =1:size(J,1)
    error5=[error5 log10(thetacomputing(0.5,J(i),0,0.5))];
end
semilogx(J,error5,':+k')
%D1:theta=1 miu=5
error6=[];
for i =1:size(J,1)
    error6=[error6 log10(thetacomputing(1,J(i),5,0))]
end
semilogx(J,error6,'-*k')

ylabel('log_{10}E^{n}')
xlabel('J')

%D2:theta=1 v=0.5
error7=[];
for i =1:size(J,1)
    error7=[error7 log10(thetacomputing(1,J(i),0,0.5))];
end
semilogx(J,error7,'--*k')
