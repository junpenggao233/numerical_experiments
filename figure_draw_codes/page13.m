function page13(tf,delta_t,delta_x)%传入参数步长和时间
UN=zeros(1,1+1/delta_x);
UN2=zeros(1,1+1/delta_x);
%generate a matrix to save the value of the next time step
%UN1 is to keep the last step data for loop because it will use the
%previous data(the position has changed)
%UN2 is generated to record the true value
for i=2:0.5/delta_x
    UN(i)=2*(i-1)*delta_x;
end
for i=0.5/delta_x+1:1/delta_x
    UN(i)=2-2*(i-1)*delta_x;
end
UN1=UN;
for j = 1:tf
    for i = 2: 1/delta_x
        UN(i)=UN1(i)+delta_t/delta_x^2*(UN1(i+1)-2*UN1(i)+UN1(i-1));%对每个UN在时间范围和每行更新
    end
    UN1=UN;
end
m=linspace(1,400,400);
X=0:delta_x:1;
X2=0:delta_x:1;
%X2=0:0.0002:1;
for i =1:21
    UN2(i)=sum(8./((m*pi()).^2).*sin(m*pi()/2).*exp(-(m*pi()).^2*delta_t*tf).*sin(m*pi()*X2(i)));
end
hold on
plot(X,UN,'Marker','.','MarkerSize',10,'Color','k')
plot(X,UN2,'Color','k')