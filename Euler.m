function y=Euler(h)
y1=0;
y2=100;
k=[];
for i=1:10
    y1=y2;
    y2=y1-h*50*y1;
    k(1,i)=y2;
    k(2,i)=100*exp(-50*i*h);
end
y3=0;
y4=100;
for i=1:10
    y3=y4;
    y4=y3/(1+h*50);
    k(3,i)=y4;
end
k
    
