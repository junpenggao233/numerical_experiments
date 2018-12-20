function maxerror=thetacomputing(theta,J,miu,v)
%this function is to compute theta numerical method
%generate the tridiagnal matrix
delta_x=1/J;
%according to v or miu given to get the value of delta_t and delta_x 
if v==0
    delta_t=miu*delta_x^2;
else
    delta_t=v*delta_x;
    miu=delta_t/delta_x^2;
end
x=linspace(0,1,J+1)';
X=x(2:J);
implicmatrix=diag((1+2*theta*miu)*ones(1,J-1))+diag((-theta*miu)*ones(1,J-2),1)+diag((-theta*miu)*ones(1,J-2),-1);
explicmatrix=diag((2*theta*miu-2*miu+1)*ones(1,J-1))+diag(((1-theta)*miu)*ones(1,J-2),1)+diag(((1-theta)*miu)*ones(1,J-2),-1);
%U0 is the initial condition 
U0=x.*(1-x);
%adjust the length of U0 the same as iterative matrix
U0=U0(2:J);
%define m to use fourier series generating the true value
m=linspace(1,500,500);
%u save the true value
u=U0;
%error matrix is to save the value of the true value and numerical method
%value 
error=[];
%first disscuss theta isnot equal to 0,which we can treat it as tridiagonal
%system,then treat theta=0 situation as explicit method
if theta ~=0
    for k =1:floor(1/delta_t)
        %every time we use the previous matrix generating all Un
        U1=implicmatrix\(explicmatrix*U0);
        U0=U1;
        if k*delta_t>=0.1
            for i=1:J-1
                u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*k).*sin(m*pi()*X(i)));
            end
            error=[error max(abs(U1-u))];
        end
    end
else
    for k =1:floor(1/delta_t)
        U1=explicmatrix*U0;
            U0=U1;
        if k*delta_t >= 0.1
            for i=1:J-1
                u(i)=sum(4./((m*pi()).^3).*(1-(-1).^m).*exp(-(m*pi()).^2*delta_t*k).*sin(m*pi()*X(i)));
            end
            error=[error max(abs(u-U1))];
        end
    end
end
%get the max of max error vector
maxerror=max(error);