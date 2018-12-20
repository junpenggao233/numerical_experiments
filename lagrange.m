function y=lagrange(a,b,n,x0)
xi=-1:(2/n):1;
yi=1./(1+25*xi.^2);
m=length(xi);
l=ones(1,length(xi));
for k=1:m
    for j=1:m
        if j~=k
            l(k)=l(k)*(x0-xi(j))/(xi(k)-xi(j));
        end
    end
end
y=sum(yi.*l);
        