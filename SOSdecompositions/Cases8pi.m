%theta=pi/8;beta= 2/sqrt(3)  ;alpha=1;
X0=[1/(2*sqrt(sym(6))) -sqrt(sym(3))/16 -sqrt(sym(3))/8 0 0 0 5/(8*sqrt(sym(6))) 0 0 0 0 0 0 1/(8*sqrt(sym(3))) 1/(2*sqrt(sym(6)))];

Z(:,1)=[-(1/2), 0, -3/sqrt(sym(2)), 0, 0, 0, 2, 0, 0, -3, 0, 0, 0, sqrt(sym(2)), 1]';
Z(:,2)=[0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0]';
Z(:,3)=[0, 0, 0, -3/2, 0, 0, 0, 1/sqrt(sym(2)), 1/2, 0, -1/sqrt(sym(2)), 1, 0, 0, 0]';
Z(:,4)=[-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]';

%UU=X0*24/sqrt(6)-subs(Fd,k3,0)*2
%%
%beta=2/sqrt(5);alpha=sqrt(2);
X0=[1/sqrt(sym(10)) -sqrt(sym(5))/32 -sqrt(sym((5/2)))/8 0 0 0 9/(16*sqrt(sym(5))) 0 0 0 0 0 0 1/(8*sqrt(sym(5))) 1/sqrt(sym(10))];

Z(:,1)=[-1/4, 0, -5/6, 0, 0, 0, 2*sqrt(sym(2))/3, 0, 0, -5/3, 0, 0, 0, sqrt(sym(2))/3, 1]';
Z(:,2)=[0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0]';
Z(:,3)=[0, 0, 0, -5/(2*sqrt(sym(2))), 0, 0, 0, 1/2, 3/(2*sqrt(sym(2))), 0, -1/sqrt(sym(2)), 1, 0, 0, 0]';
Z(:,4)=[-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]';

syms x y z

M=[x  -(3*2^(1/2))/4   5*y-3    0   0;
  -(3*2^(1/2))/4  (3*y)/2-x + 24/5  -(2^(1/2)*(40*y - 27))/10  0  0;
  5*y-3  -(2^(1/2)*(40*y - 27))/10    10*y - 6*z  0   0;
  0    0    0    6*z  -(2^(1/2)*(10*y - 3))/5;
  0    0    0  -(2^(1/2)*(10*y - 3))/5   24/5-6*y];

% M=-6*subs(Fd,k3,0)+X0*24*sqrt(sym(2))/sqrt(sym(5))
%系数提出1/(4*Q)  Q=6*sqrt(2/5)
%%
%beta=2/3;alpha=2;

X0=[sqrt(sym(2))/3, -3/64, -(3/16), 0, 0, 0, 17/(48*sqrt(sym(2))), 0, 0, 0, 0, 0, 0, 1/24, sqrt(sym(2))/3];

Z(:,1)=[-(1/8), 0, -9/(14*sqrt(sym(2))), 0, 0, 0, 4/7, 0, 0, -(9/7), 0, 0, 0, sqrt(sym(2))/7, 1]';
Z(:,2)=[0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0]';
Z(:,3)=[0, 0, 0, -9/4, 0, 0, 0, 1/(2*sqrt(sym(2))), 7/4, 0, -1/sqrt(sym(2)), 1, 0, 0, 0]';
Z(:,4)=[-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]';

%Q=10*sqrt(2)/3;

%%
syms k1 k2 k3 k4 real
sol=k1*Z(:,1)+k2*Z(:,2)+k3*Z(:,3)+k4*Z(:,4);
ll=[1 2 3 4 5 2 6 7 8 9 3 7 10 11 12 4 8 11 13 14 5 9 12 14 15];
Fd=reshape(sol(ll),5,5);
X0=reshape(X0(ll),5,5);

%%

syms x y z
M=cell(5,5);
M{1,1}=x;  M{1,2}=-1/sqrt(2);  M{1,3}=3/sqrt(2)*y; M{1,4}=0; M{1,5}=0;
M{2,2}=5/3-x+y/2;  M{2,3}=1/3-2*y; M{2,4}=0; M{2,5}=0;
M{3,3}=2+3*y-z; M{3,4}=0; M{3,5}=0; 
M{4,4}=z; M{4,5}=-sqrt(2)/3-sqrt(2)*y;
M{5,5}=2/3-y;
for jj=1:5
    for ii=1:5
        if (jj<ii)
            M{ii,jj}=M{jj,ii};
        end
    end
end

 M1=cell2sym(M);
 
 
 A12=det(M(1:2,1:2));
 A13=det(M([1 3],[1 3]));
 A23=det(M(2:3,2:3));
 A45=det(M(4:5,4:5));
 A123=det(M(1:3,1:3));
 
 
 A12=det(M1(1:2,1:2));A13=det(M1([1 3],[1 3]));
 A23=det(M1(2:3,2:3));A45=det(M1(4:5,4:5));
 A123=det(M1(1:3,1:3));
%%
syms x y z real
ind1=[];ind2=[];ind3=[];

for x=3/2%[1/2:0.1:3/2]
    for y=1/3%[-1/3:0.1:1/3]
        for z=8/3%[0:0.5: 8/3]
            M(1,1)=x;      M(1,2)=-1/sqrt(2);  M(1,3)=3/sqrt(2)*y; M(1,4)=0;     M(1,5)=0;
            M(2,1)=M(1,2); M(2,2)=5/3-x+y/2;   M(2,3)=1/3-2*y;     M(2,4)=0;     M(2,5)=0;
            M(3,1)=M(1,3); M(3,2)=M(2,3);      M(3,3)=2+3*y-z;     M(3,4)=0;     M(3,5)=0;
            M(4,1)=M(1,4); M(4,2)=M(2,4);      M(4,3)=M(3,4);      M(4,4)=z;     M(4,5)=-sqrt(2)/3-sqrt(2)*y;
            M(5,1)=M(1,5); M(5,2)=M(2,5);      M(5,3)=M(3,5);      M(5,4)=M(4,5);M(5,5)=2/3-y;
            
        end
    end
end
   
%% check SOS 
P1= (cos(2*theta)/alpha)^2*FF{1,1}+alpha^2*FF{2,2}+FF{3,3}...
 -cos(2*theta)*(FF{1,2}+FF{2,1})-cos(2*theta)/alpha*(FF{1,3}+FF{3,1})+alpha*(FF{2,3}+FF{3,2});
P1=simplify(P1);
D1=simplify(P1+alpha^2*FF{5,5});

B=sqrt((1+alpha^2)*(4+beta^2));
k1=2*(alpha^2+1)/(alpha*B);
k2=beta/(2*alpha);
k3=beta/2;
k4=B/2;
k5=beta/2;
L1=k1^2*FF{1,1}+k2^2*FF{2,2}+k3^2*FF{3,3}...
    -k1*k2*(FF{1,2}+FF{2,1})+k1*k3*(FF{1,3}+FF{3,1})-k2*k3*(FF{2,3}+FF{3,2});
L2=alpha^2*(k4^2*FF{4,4}+k5^2*FF{5,5}-k4*k5*(FF{4,5}+FF{5,4}));
D2=L1+L2/alpha^4;
%%
%test t
%group1  beta=2/3;alpha=2;
FD1=3*(1/8*FF{1,1}+FF{3,3}-1/(2*sqrt(2))*(FF{1,3}+FF{3,1})+FF{1,1})+D1; % *3/4 根据 D1 or L1乘以一个常数
FD2=3/4*(1/8*FF{1,1}+FF{3,3}-1/(2*sqrt(2))*(FF{1,3}+FF{3,1})+FF{1,1})+D2;
%g2  beta=2/sqrt(5);alpha=sqrt(2);
FD1=(1/4*FF{1,1}+FF{3,3}-1/2*(FF{1,3}+FF{3,1}))+FF{1,1}+D1;
FD2=1/2*((1/4*FF{1,1}+FF{3,3}-1/2*(FF{1,3}+FF{3,1}))+FF{1,1})+D2;
%g3  beta=sqrt(8/11);alpha=3/2;
FD1=5/4*((2/9*FF{1,1}+FF{3,3}-sqrt(2)/3*(FF{1,3}+FF{3,1}))+FF{1,1})+D1;
FD2=4/9*(5/4*((2/9*FF{1,1}+FF{3,3}-sqrt(2)/3*(FF{1,3}+FF{3,1}))+FF{1,1}))+D2;
FD1=simplify(FD1);
FD2=simplify(FD2);

