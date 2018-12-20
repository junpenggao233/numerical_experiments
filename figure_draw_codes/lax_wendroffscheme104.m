function lax_wendroffscheme104(delta_x,delta_t,tf)
x=zeros(1,1/delta_x+1);
x((0.2/delta_x+2):(0.4/delta_x))=0.02;
a=exp(-10^(4*x-1)^2);
v=a*delta_t/delta_x;
ui=x;
u=x;
x=0:delta_x:1;
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