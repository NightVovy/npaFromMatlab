clear;clc;
G=generateQ(2,2);
G0=nummtostrm(G);
E=uniquecell(G0)';%?????????????????? what is uniquecell function

for n=1:2
eval(['R',num2str(n),'=cell(1,3);']);%???????????????????  generate Rn, which is a 1 by 3 cell
end
for n=3:5
eval(['R',num2str(n),'=cell(1,5);']);
end
% syms pi
% theta=pi/8;
R1{1,1}=[1 0];R1{1,2}=[2 0]; R1{1,3}=[2 1];    % R is the basis                                         

R2{1,1}=[9 0];R2{1,2}=[1 0;2 0];R2{1,3}=[1 0;2 1];     

R3{1,1}=[9 0];R3{1,2}=[2 0]; R3{1,3}=[2 1]; R3{1,4}=[1 1;2 0];R3{1,5}=[1 1;2 1];        

R4{1,1}=[1 1];R4{1,2}=[2 0]; R4{1,3}=[2 1]; R4{1,4}=[1 1;2 0];R4{1,5}=[1 1;2 1];         

R5{1,1}=[1 1]; R5{1,2}=[1 0;2 0];R5{1,3}=[1 0;2 1];R5{1,4}=[1 1;2 0];R5{1,5}=[1 1;2 1]; 

for n=1:5
eval(['C',num2str(n),'=[];']);
end

% beta=2/sqrt(3);alpha=1; 
%beta=2/sqrt(5);alpha=sqrt(2);
beta=2/3;alpha=2;
%beta=sqrt(8/11);alpha=3/2; %for theta=pi/8;

%beta=sqrt(4/11);alpha=sqrt(2);
% beta=sqrt(1/3);alpha=3/2; %for theta=pi/6
% syms beta alpha real
theta=1/2*asin(sqrt((4-beta^2*alpha^2)/(4+beta^2)))
C1=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) 1 1]
C2=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) 1 1]
C3=[-2/sqrt(alpha^2+sin(2*theta)^2) cos(2*theta)/alpha cos(2*theta)/alpha 1 -1]
%C3=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) cos(2*theta) cos(2*theta) alpha -alpha];
C4=[-2/sqrt(alpha^2+sin(2*theta)^2) 1 -1 cos(2*theta)/alpha cos(2*theta)/alpha]
C5=[-2*cos(2*theta)/sqrt(alpha^2+sin(2*theta)^2) 1 -1 1/alpha 1/alpha]
llllllllllllllllllllllllll

% C1=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) 1 1];
% C2=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) 1 1];
% C3=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) cos(2*theta) cos(2*theta) alpha -alpha];
% C4=[-2*alpha/sqrt(alpha^2+sin(2*theta)^2) alpha -alpha cos(2*theta) cos(2*theta)];
% C5=[-2*alpha*cos(2*theta)/sqrt(alpha^2+sin(2*theta)^2) alpha -alpha 1 1];

%%
g=0;
for s=1:5
    for t=1:5
    g=g+1;
    F{1,g}=Times(eval(['R' num2str(s)]),eval(['R' num2str(t)]));  %25���ַ�����
    F{s,t}=Times(eval(['R' num2str(s)]),eval(['R' num2str(t)]));  %25���ַ�����
    Coe{s,t}=Numtimes(eval(['C' num2str(s)]),eval(['C' num2str(t)]));
    end
end

FF=cell(5,5);
for s=1:5
    for t=1:5
    FF{s,t}=sum(sum(cell2sym(F{s,t}).*Coe{s,t}));%25������ʽ
end
end

%% only use to check SOS


% P1= (cos(2*theta)/alpha)^2*FF{1,1}+alpha^2*FF{2,2}+1/alpha^2*FF{3,3}...
%  -cos(2*theta)*(FF{1,2}+FF{2,1})-cos(2*theta)/alpha^2*(FF{1,3}+FF{3,1})+(FF{2,3}+FF{3,2});

P1= (cos(2*theta)/alpha)^2*FF{1,1}+alpha^2*FF{2,2}+FF{3,3}...
 -cos(2*theta)*(FF{1,2}+FF{2,1})-cos(2*theta)/alpha*(FF{1,3}+FF{3,1})+alpha*(FF{2,3}+FF{3,2});
P1=simplify(P1);
I=P1+alpha^2*FF{5,5};




%%
% E1=cell2sym(E);%

Ind=cell(1,25);
for k=1:25
for g=1:25
    if (isempty(find(ismember(F{1,g},E{1,k})))==0)  %����ÿһ��Ԫ�أ��ж����Ƿ�����25���ַ������У�
        Ind{1,k}=[Ind{1,k} g];%����������ַ�����
    end
end
end


X=cell(1,25);Y=cell(1,25);%x=[];y=[];
for k=1:25
    f=0;
    for s=1:5
        for t=1:5
            f=f+1;
           Coe{1,f}=Numtimes(eval(['C' num2str(s)]),eval(['C' num2str(t)]));  %25���ַ�����
            if (ismember(f,Ind{1,k})==1)   %f �����ײ�����ڵ��ַ����� g,���Ǵ�ʱ��ϵ������
                X{1,k}=[X{1,k} s];
                Y{1,k}=[Y{1,k} t];  %ind�е�����
            end
        end
    end
end

% 
% FF=cell(1,25);
% for j=1:3
%     FF{1,j}=sum(sum(cell2sym(F{1,j}).*Coe{1,j}));%25������ʽ
% end

M=cell(1,25);
 for k=1:25
      M{1,k}=zeros(5,5);  %����25��ȫ�����
       R(k)=size(Ind{1,k},2);
     for ii=1:R(k)
        M{1,k}(X{1,k}(1,ii),Y{1,k}(1,ii))=sum(sum(ismember(F{1,Ind{1,k}(ii)},E{1,k}).*Coe{1,Ind{1,k}(ii)}));
     end
 end
 
%%
%�����Է����鲿��
W=cell(1,15);
 for i=1:15
   W{1,i}=['u' num2str(i)];
 end
 
W=cell2sym(W);
syms u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 real
U=[u1 u2 u3 u4 u5;
    u2 u6 u7 u8 u9;
    u3 u7 u10 u11 u12;
    u4 u8 u11 u13 u14;
    u5 u9 u12 u14 u15 ];
U1=reshape(U,1,25);

 D=cell(25,1);
 A=zeros(1,25);
 for g=1:25
  A(g,:)=reshape(M{1,g},1,25);
  D{g,1}=U1*A(g,:)';
 end
 
 for g=1:25
     for i=1:15
         A=coeffs(D{g,1},W(1,i));
         if(size(A,2)==1)
             A1(g,i)=0;
         else
             A1(g,i)=A(1,2);
         end
     end
 end
 
 %AU1=b����
 % alpha=2*cos(2*theta)/sqrt(1+sin(2*theta)^2);
 %beta=2*cu/sqrt(1+su^2); alpha=3/2;
 b=zeros(1,25);
 b(1,1)=2*sqrt((1+alpha^2)*(1+beta^2/4));b(1,find(ismember(E,'A0')))=-beta;  
 b(1,find(ismember(E,'A0B0')))=-alpha; b(1,find(ismember(E,'A0B1')))=-alpha;
 b(1,find(ismember(E,'A1B0')))=-1; b(1,find(ismember(E,'A1B1')))=1;
 
 b=b';
 
 
 %%1
 A1=double(A1);
 B=[A1 b];
 rA=rank(A1);
 rB=rank(B);
 
%%


 n=15;
 if(rA==rB&&rA==n)
     sol=A1\b;
  else
     if (rA==rB&&rA<n)
          X0=A1\b
        Z=null(A1)
     else
         sol='Nall';
     end
 end
 

syms k1 k2 k3 k4 real
sol=k1*Z(:,1)+k2*Z(:,2)+k3*Z(:,3)+k4*Z(:,4);
ll=[1 2 3 4 5 2 6 7 8 9 3 7 10 11 12 4 8 11 13 14 5 9 12 14 15];
format short
Fd=(reshape(sol(ll),5,5));
X0=reshape(X0(ll),5,5)

% (Fd+ X0)
 

 
 