clear all

Z=[1,0;0,-1];
X=[0,1;1,0];
Y=1i*[0,1;-1,0];
I=[1,0;0,1];

psi0=[1;0];
psi1=[0;1];
%% CHSH inequality
a=pi/8;b=pi/7;
syms a b
mu=1-sqrt(2)/(2*(sqrt(2)-1))
s=1/(4*(sqrt(2)-1))

s=(4+5*sqrt(2))/16;
mu=-(1+2*sqrt(2))/4;
% % syms a b
B0=cos(b)*X+sin(b)*Z;
B1=cos(b)*X-sin(b)*Z;
A0=cos(a)*X+sin(a)*Z;
A1=cos(a)*X-sin(a)*Z;
g=@(a)(1+sqrt(2))*(sin(a)+cos(a)-1);
r1=2*sqrt(2+sin(2*a)*sin(2*b));
r2=2*sqrt(2-sin(2*a)*sin(2*b));
rotA=Tensor(cos(a)*psi0+sin(a)*psi1,psi0')+Tensor(-sin(a)*psi0+cos(a)*psi1,psi1');
rotB=Tensor(cos(b)*psi0+sin(b)*psi1,psi0')+Tensor(-sin(b)*psi0+cos(b)*psi1,psi1');
% g=@(a)(sin(2*a))^(1/2);
BCHSH=Tensor(A0,B0)+Tensor(A0,B1)+Tensor(A1,B0)-Tensor(A1,B1)
[u1,v1]=eig(BCHSH)
lllllllllllll
% rho=(Tensor(I,I)+Tensor(Y,Y)+(Tensor(X,X)+Tensor(Z,X)+Tensor(X,Z)-Tensor(Z,Z))/sqrt(2))/4
psi=sin(pi/8)*(Tensor(psi0,psi0)-Tensor(psi1,psi1))/sqrt(2)+cos(pi/8)*(Tensor(psi0,psi1)+Tensor(psi1,psi0))/sqrt(2);
rho=Tensor(psi,psi'); %
% CHI=((1+g(a))*(1+g(b))*rho+(1+g(b))*(1-g(a))*(Tensor(X,I))*rho*(Tensor(X,I))+(1-g(b))*(1+g(a))*(Tensor(I,X))*rho*(Tensor(I,X))+(1-g(b))*(1-g(a))*(Tensor(X,X))*rho*(Tensor(X,X)))/4
% CHI=((1+g(a))*(1+g(b))*rho+(1+g(b))*(1-g(a))*((Tensor(I,I))+(1-g(b))*(1+g(a))*(Tensor(I,I)))+(1-g(b))*(1-g(a))*(Tensor(X,X))*rho*(Tensor(X,X)))/4;
CHI=((1+g(a))*(1+g(b))*rho+(1+g(b))*(1-g(a))*(Tensor(I,I))/4+(1-g(b))*(1+g(a))*(Tensor(I,X))*rho*(Tensor(I,X))+(1-g(b))*(1-g(a))*(Tensor(I,I))/4)/4

% [u,v]=eig(CHI)
CHI=(Tensor(I,I)+g(a)*g(b)*Tensor(Y,Y)+(Tensor(X,X)+g(a)*Tensor(Z,X)+g(b)*Tensor(X,Z)-g(a)*g(b)*Tensor(Z,Z))/sqrt(2))/4
F=CHI-s*BCHSH-mu*Tensor(I,I)
[u,v]=eig(F)
%% Mermin inequality


% [u,v]=eig(rho-s*BCHSH+mu*Tensor(I,I))
% [u,v]=eig(BCHSH);
% v
% u
% LLLLLLLLLLL
% [u,s,v]=svd(BCHSH)
% llllllllllllllll
% mu=1-sqrt(2)/(2*(sqrt(2)-1))
% s=1/(4*(sqrt(2)-1))
% a=pi/124;b=pi/128
% s=(4+5*sqrt(2))/16
% mu=-(1+2*sqrt(2))/4
% 
% %  g=@(a)((sin(2*a))^(2/3)+5*(sin(2*a))^(1))/6;
%  g=@(a)(1+sqrt(2))*(sin(a)+cos(a)-1);
%  g=@(a)0;

% y0 = 2*(1/4-mu)^2 + (-1 -g(a)^2 - g(b)^2 +(g(a)*g(b))^2)/16 - 8*s^2 + s*sqrt(2)*(cos(a) + g(a)* sin(a))*(cos(b) + g(b)*sin(b))+(-mu*g(a)*g(b) +  s*sqrt(2)*(g(a)*cos(a) + sin (a))*(g(b)* cos(b)+ sin(b))- 8*s^2* sin(2*a)*sin(2*b));
% y1 =2*(1/4-mu)^2 + (-1 -g(a)^2 - g(b)^2 +(g(a)*g(b))^2)/16 - 8*s^2 + s*sqrt(2)*(cos(a) + g(a)* sin(a))*(cos(b) + g(b)*sin(b))-(-mu*g(a)*g(b) +  s*sqrt(2)*(g(a)*cos(a) + sin (a))*(g(b)* cos(b)+ sin(b))- 8*s^2* sin(2*a)*sin(2*b));
% 
% [2*(1/4-mu)^2, (-1 -ga^2 - gb^2 +(ga*gb)^2)/16, s^2,-8*s^2, s*sqrt(2)*(cos(a) + g(a)* sin(a))*(cos(b) + gb*sin(b)),(-mu*ga*gb +  s*sqrt(2)*(ga*cos(a) + sin (a))*(gb* cos(b)+ sin(b))- 8*s^2* sin(2*a)*sin(2*b))]
% [2*(1/4-mu)^2 ;y0;y1]
% [u,v]=eig(BCHSH)
