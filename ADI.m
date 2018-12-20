function ADI(tf,delta_t,delta_x,delta_y)
miux=delta_t/delta_x^2;
miuy=delta_t/delta_y^2;
x=0:delta_x:1;
y=0:delta_y:1;
J=1/delta_x;
implicit1=diag((1+miux)*ones(1,1/delta_x+1))+diag((-miux/2)*ones(1,1/delta_x),1)+diag((-miux/2)*ones(1,1/delta_x),-1);
explicit1=diag((1-miuy)*ones(1,1/delta_y+1))+diag((miuy/2)*ones(1,1/delta_y),1)+diag((miuy/2)*ones(1,1/delta_y),-1);
implicit2=diag((1+miuy)*ones(1,1/delta_y+1))+diag((-miuy/2)*ones(1,1/delta_y),1)+diag((-miuy/2)*ones(1,1/delta_y),-1);
explicit2=diag((1-miux)*ones(1,J+1))+diag((miux/2)*ones(1,1/delta_x),1)+diag((miux/2)*ones(1,1/delta_x),-1);
U0=zeros(1/delta_x-1,1/delta_y-1);
load('M.mat')
for i=1:tf/delta_t
    U1=implicit1\(explicit1*M);
    U2=implicit2\(explicit2*U1);
    M=U2;
end
x1 = 0:0.01:1;
y1 = 0:0.01:1;
[xx1,yy1] = meshgrid(x1,y1);
u0 = @(x,y) interp2(xx1,yy1,M,x,y);
surf(xx1,yy1,M)