function page19
%UN is the boundary condition 
%X is the x-axis of the plot
delta_t=0.005;
delta_x=0.1;
X=linspace(0,1,11);
UN=zeros(1,11);
for i=1:10
    UN(i)=X(i)*(1-X(i));
end
%get a new vector to update value for the time loop
UN1=UN;
%this segment of code is to use explicit method to approximately calculate
%U^n_j
u=UN;
m=linspace(1,1000,1000);
E=[];
for j =1:200
    for i = 1:10
        u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*j).*sin(m*pi()*X(i)));
    end
    for i = 2:10
            UN(i)=UN1(i)+delta_t/delta_x^2*(UN1(i+1)-2*UN1(i)+UN1(i-1));
    end
    UN1=UN;
    E=[E max(abs(UN-u))];
end
%the next segment of code is to calculate the accurate solution of u
t=linspace(0.005,1,200);
hold on
plot(t,log10(E))
%for the second plot
F=[];
delta_t=0.5*0.05^2;
delta_x=0.05;
X=linspace(0,1,1+1/delta_x);
UN=X.*(1-X);
UN1=UN;
u=UN;
for j =1:1/delta_t
    for i = 1:1/delta_x
        u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*j).*sin(m*pi()*X(i)));
    end
    for i = 2:(1/delta_x)
            UN(i)=UN1(i)+delta_t/delta_x^2*(UN1(i+1)-2*UN1(i)+UN1(i-1));
    end
    UN1=UN;
    F=[F max(abs(UN-u))];
end
t=linspace(0.005,1,1/delta_t);
plot(t,log10(F))
ylabel('log_{10}E^{n}')
xlabel('t_{n}')