function page19implicit
%UN is the boundary condition 
%X is the x-axis of the plot
delta_t=0.005;
delta_x=0.1;
X=linspace(0,1,11);
X=X(2:10);
miu=delta_t/delta_x^2;
J=1/delta_x;
%UN is the initial condition vector
matrix=diag((1+2*miu)*ones(1,J-1))+diag(-miu*ones(1,J-2),1)+diag(-miu*ones(1,J-2),-1);
UN=X.*(1-X);
%get a new vector to update value for the time loop
UN1=UN';
%this segment of code is to use explicit method to approximately calculate
%U^n_j
u=UN';
m=linspace(1,1000,1000);
E=[];
for j =1:200
    for i = 1:9
        u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*j).*sin(m*pi()*X(i)));
    end
    UN=matrix\UN1;
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
miu=delta_t/delta_x^2;
J=1/delta_x;
matrix=diag((1+2*miu)*ones(1,J-1))+diag(-miu*ones(1,J-2),1)+diag(-miu*ones(1,J-2),-1);
X=linspace(0,1,1+1/delta_x);
X=X(2:1/delta_x);
UN=X.*(1-X);
UN1=UN';
u=UN';
for j =1:1/delta_t
    for i = 1:1/delta_x-1
        u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*j).*sin(m*pi()*X(i)));
    end
    UN=matrix\UN1;
    UN1=UN;
    F=[F max(abs(UN-u))];
end
t=linspace(0.005,1,1/delta_t);
plot(t,log10(F))
ylabel('log_{10}E^{n}')
xlabel('t_{n}')