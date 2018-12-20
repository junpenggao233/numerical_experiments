function garlinkin(k)
syms x
matrix=zeros(k);
for i =1:k
    for j=1:k
        matrix(i,j)=int(diff(x^(i)*(x-1))*diff(x^(j)*(x-1)),x,0,1);
    end
end
f=zeros(k,1);
for i = 1:k
    f(i)=int(x^(i)*(x-1),x,0,1);
end
a=matrix\f;
xx=0:0.05:1;
y=zeros(21,1);
for j = 1:21 
    for i =1:k
        y(j)=y(j)+(xx(j)^i)*(xx(j)-1)*a(i);
    end
end
plot(xx,y)
A=double(matrix);
s=svd(A)
cond=max(s)/min(s)