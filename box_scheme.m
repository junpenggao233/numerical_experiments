function box_scheme(delta_x,delta_t,tf)
x=zeros(1,1/delta_x+1);
ui=x;
u=x;
x=0:delta_x:1;
u=exp(-10*(4*x-1).^2);
v=a*delta_t/delta_x;
for i=1:(tf/delta_t)
    for j=2:(1/delta_x)
        u(j)=1/2*v(j)*(1+v(j))*ui(j-1)+(1-v(j)^2)*ui(j)-1/2*v(j)*(1-v(j))*ui(j+1);
    end
    a=(1+x.^2)./(1+2*x*i*delta_t+2*x.^2+x.^4);
    v=a*delta_t/delta_x;
    ui=u;
end
plot(x,u,'LineStyle','--','Marker','.','Color' ,'k')
ylim([-0.005 0.025])
