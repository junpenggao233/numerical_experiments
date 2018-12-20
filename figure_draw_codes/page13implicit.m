function page13implicit(tf,delta_t,delta_x)
U0=0:delta_x:1;
for i=2:0.5/delta_x
    U0(i)=2*(i-1)*delta_x;
end
for i=0.5/delta_x+1:1/delta_x
    U0(i)=2-2*(i-1)*delta_x;
end
U0=U0(2:20);
miu=delta_t/delta_x^2;
J=1/delta_x;
%generate the tridiagnal matrix to express the implicit method
matrix=diag((1+2*miu)*ones(1,J-1))+diag(-miu*ones(1,J-2),1)+diag(-miu*ones(1,J-2),-1);
U0=U0';
U1=U0;
for i=1:tf
    U1=matrix\U0;
    U0=U1;
end
U1=[0 ;U1; 0];
m=linspace(1,400,400);
X=0:delta_x:1;
X2=0:delta_x:1;
%X2=0:0.0002:1;
for i =1:21
    UN2(i)=sum(8./((m*pi()).^2).*sin(m*pi()/2).*exp(-(m*pi()).^2*delta_t*tf).*sin(m*pi()*X2(i)));
end
hold on
plot(X,U1','Marker','.','MarkerSize',10,'Color','k')
plot(X,UN2,'Color','k')


