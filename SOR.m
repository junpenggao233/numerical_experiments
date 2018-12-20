function y=SOR(A,b,x,w)
y=1:length(x);
[m,n]=size(A);
s=0;
add1=0;
add2=0;
while norm(x-y,1)>0.00001
   y=x;
   for i=1:length(b)
       for j=1:i-1
           add1=add1+A(i,j)*x(j);
       end
       for j=i:n
           add2=add2+A(i,j)*y(j);
       end
       x(i)=x(i)+w*(b(i)-add1-add2)/A(i,i);
       add1=0;
       add2=0;
   end
   s=s+1;
end
s