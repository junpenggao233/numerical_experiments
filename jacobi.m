function y=jacobi(A,b,x)
y=1:length(x);
[m,n]=size(A);
s=0;
add=0;
while norm(x-y,1)>0.00001
   y=x;
   for  i=1:length(b)
       for j=1:n
           add=add+A(i,j)*y(j);
       end
       add=add-A(i,i)*y(i);
       x(i)=(b(i)-add)/A(i,i);
       add=0;
   end
   s=s+1;
end
s

       