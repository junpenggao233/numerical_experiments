function FEM_N(k)
syms x
matrix=zeros(k-1);
xx=0:1/k:1;
for i =2:k
    for j=2:k
        if j==i-1
            matrix(i-1,j-1)=-k;
            %int(1/(xx(i)-xx(i-1))*1/(xx(j)-xx(j+1)),x,xx(i-1),xx(i+1));
        elseif j==i+1
            matrix(i-1,j-1)=-k;
            %int(1/(xx(i)-xx(i+1))*1/(xx(j)-xx(j-1)),x,xx(i),xx(i+1));
        elseif j==i
            matrix(i-1,j-1)=2*k;
            %(1/(xx(i)-xx(i-1))^2+1/(xx(i)-xx(i+1))^2)*1/k;
        else
            matrix(i-1,j-1)=0;
        end
    end
end
f=zeros(k-1,1);
for i = 2:k
    f(i-1)=int((x-xx(i-1))/(xx(i)-xx(i-1)),x,xx(i-1),xx(i))+int((x-xx(i+1))/(xx(i)-xx(i+1)),x,xx(i),xx(i+1));
end
a=matrix\f;
xaxis=0:0.05:1;
y=zeros(21,1);
for j = 1:21 
    for i =2:k
        if (xx(i-1)<xaxis(j)) && (xaxis(j)<xx(i))
            N=(xaxis(j)-xx(i-1))/(xx(i)-xx(i-1));
        elseif (xx(i)<xaxis(j)) && (xaxis(j)<xx(i+1))
            N=(xaxis(j)-xx(i+1))/(xx(i)-xx(i+1));
        elseif xx(i)==xaxis(j)
            N=1;
        else
            N=0;
        end
        y(j)=y(j)+ N*a(i-1);
    end
end
plot(xaxis,y)