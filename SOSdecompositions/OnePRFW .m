clear;
clc;

%test for free will one side
G=generateQ(2,2);
G0=nummtostrm(G);  

G1=judgereplace(G);
G2=eqmatstr(G);
[U,V]=matrixtoV(G1);
G3=mvterrepstrv(G2,V);
r1=size(U,1);
r2=size(V,2);

u=sdpvar(1,r1);
v=sdpvar(1,r2);

for i=2:r1
    cmd1 = [U{i,1} '=u(i);'];
    eval(cmd1);
end

str1 = ['M = [' toText(G3) '];'] ; 
eval(str1)

%p=0.7; %Alice 选择A1的概率


alpha=1.4%0.7;
%beta=1.2
%2-2*alpha
beta=1.3

%up=(2-2*p)/p;% alpha的上界
p=alpha/(1+alpha);

%obj=alpha*A1+A1B1+A1B2+A2B1-A2B2;

obj=beta*A1+alpha*A1B1+alpha*A1B2+A2B1-A2B2;

%beta=p/(1-p)*alpha;

%obj=beta*A1+p/(1-p)*A1B1+p/(1-p)*A1B2+A2B1-A2B2;


F = [M>=0; u<=1; u>=-1,v>=-1;v<=1;];%

sol = optimize(F,-obj);
obj=double(obj)

%IQ=2*sqrt((1+(p/(1-p))^2)*(1+beta^2/4))

IQ=2*sqrt((1+alpha^2)*(1+beta^2/4))
LB=beta+2*alpha
% IdealQB=2*sqrt((4*(1-p)^2+(alpha*p)^2)*(p^2+(1-p)^2))/(1-p) %ideal 量子界
% LocalB=2*(p*alpha+2*p) %ideal 经典界