function y=Gauss_Seidel(A,b,x)
y=1:length(x);
[m,n]=size(A);
s=0;
adda=0;
addb=0;
while max(abs(x-y))>0.0001
   y=x;
   for i=1:length(b)
       for j=1:i-1
           adda=adda+A(i,j)*x(j);
       end
       for j=j+1:n
           addb=addb+A(i,j)*x(j);
       end
       x(i)=(b(i)-adda-addb)/A(i,i);
       adda=0;
       addb=0;
   end
   s=s+1
end
