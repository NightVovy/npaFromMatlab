function [Pguess,Gram]= postCHSH_Q(eta,chshvalue)
%%%idea case:
% q0=3/4;
% p0=1;
% p1=1-p0;
% q1=1-q0;
% v=sqrt((1-q0^2)/(1+(3^2-1)*q0^2))
% CHSH=v^2*(-1+q0^2*4)
% [v^2 (1-v^2)/(3)*(1-q0^2)+v^2*q0^2]
% [v^2*q0^2,(sqrt((1-v^2)/(3)*p1*q1+v*p0*q0)),(sqrt((1-v^2)/(3)*p1*q1/3+v*p0*q0))^2]
% ffffffffffffffffffffffff
%  Alice 4 measurements each has 3 outcomes 
%  Bob 4 measurements,each has 3 outcomes   
%  Eve 1 measurement, has 2 outcomes
% eta is a 1*4 vectors, represent the successful probability of conclusive
% event [eta_A0B0,eta_A0B1,eta_A0B0,eta_A1B1]
% vector[X1,X2,X3]used to represent operators;
%  [0,0,0]identity;
%  [0,1,0]E^0;outcome 0
%  [0,1,1]E^1;outcome 1
%  [1,0,0] A_0^0
%  [1,0,1] A_0^1 ; A_0^2=[0,0,0]-[1,0,0]-[1,0,1]
%  [2,0,0] B_0^0
%  [2,0,1] B_0^1 ; B_0^2=[0,0,0]-[2,0,0]-[2,0,1]
%  [1,0,0;2,0,0] A_0^0B_0^0
%  [0,1,0;1,0,0] A_0^0E^0
%  [0,1,0;2,0,0] B_0^0E^0,......

ops=sdpsettings('solver','sedumi','verbose',1);
%% chose parameters (custom made)
eta=[1,1,1,1];%successful probability of joint probability
 chshvalue=0.004747%v^2*(-1+q0^2*4);% chsh violation
na=2;%(if Alice's outcome number is Na, put inside na=Na-1)
na_in=4;
nb=2;%(if bob's outcome number is Nb,put inside nb=Nb-1)
nb_in=4;
nc_in=1;
nc=1;%(Eve's  outcome number is Nc,put inside nc=NC-1)
Q=2; % Q used to chose level
Y= buildHierarchy(Q,na_in,na,nb_in,nb,nc_in,nc);%Y(party,measurement)
%%
Max=5;
for i=1:1:length(Y)
    for j=i:1:length(Y)
         tempY=(Y{i,j});
        [rowY,clomnY]=size(tempY);
        T(i,j)=0;
           for ir=1:1:rowY
                for jc=1:1:clomnY
                     T(i,j)=T(i,j)+tempY(ir,jc)*Max^((ir-1)*(clomnY)+jc-1);
                 end
           end
        T(j,i)=T(i,j);
    end
end

party= unique(T);% all the different items in T
B=[];%reduced the index matrix of T
for i=1:1:length(T)
    for j=1:1:length(T)
        B(i,j)=find(party==T(i,j));
    end
end

%% variable declaration
G=sdpvar(length(Y),length(Y),'hermitian'); % Gram matrix
V=sdpvar(1,length(party),'full') ;

%%Objective function 
% example: P(0,0|x=0,E)                                
% objAE=-real(V(value([0,1,0;1,0,0],party))+V(value([1,0,1],party))-V(value([0,1,0;1,0,1],party))); 
obj1=real(V(value([1,1,0;2,1,0],party)));%00
obj2=real(V(value([1,1,0],party))-V(value([1,1,0;2,1,0],party)));%01
obj3=real(V(value([2,1,0],party))-V(value([1,1,0;2,1,0],party)));%01
obj4=real(1-V(value([1,1,0],party))-V(value([2,1,0],party))+V(value([1,1,0;2,1,0],party)));%11
objAE=-real(obj1);    
%% Bell-operators
CH1=V(value([1,0,0;2,0,0],party))+V(value([1,0,0;2,1,0],party))+V(value([1,1,0;2,0,0],party))-V(value([1,1,0;2,1,0],party))-V(value([1,0,0],party))-V(value([2,0,0],party));
CH2=V(value([1,2,0;2,2,0],party))+V(value([1,2,0;2,3,0],party))+V(value([1,3,0;2,2,0],party))-V(value([1,3,0;2,3,0],party))-V(value([1,2,0],party))-V(value([2,2,0],party));
CH3=V(value([1,1,0;2,3,0],party))+V(value([1,1,0;2,2,0],party))+V(value([1,0,0;2,3,0],party))-V(value([1,0,0;2,2,0],party))-V(value([1,1,0],party))-V(value([2,3,0],party));
CH4=V(value([1,3,0;2,1,0],party))+V(value([1,3,0;2,0,0],party))+V(value([1,2,0;2,1,0],party))-V(value([1,2,0;2,0,0],party))-V(value([1,3,0],party))-V(value([2,1,0],party));
partial=V(value([1,1,0],party))+V(value([1,3,0],party))+V(value([2,1,0],party))+V(value([2,3,0],party));
CH=real(CH1+CH2-CH3-CH4-partial);%+CH2-CH3-CH4-partial
% objAE=-real(CH);    
 C=[CH==chshvalue];
%% constraints for conclusive events 
A0B0s=V(value([1,0,0;2,0,0],party))+V(value([1,0,1;2,0,1],party))+V(value([1,0,0;2,0,1],party))+V(value([1,0,1;2,0,0],party));
A0B1s=V(value([1,0,0;2,1,0],party))+V(value([1,0,1;2,1,1],party))+V(value([1,0,0;2,1,1],party))+V(value([1,0,1;2,1,0],party));
A1B0s=V(value([1,1,0;2,0,0],party))+V(value([1,1,1;2,0,1],party))+V(value([1,1,0;2,0,1],party))+V(value([1,1,1;2,0,0],party));
A1B1s=V(value([1,1,0;2,1,0],party))+V(value([1,1,1;2,1,1],party))+V(value([1,1,0;2,1,1],party))+V(value([1,1,1;2,1,0],party));

A0s=V(value([1,0,0],party))+V(value([1,0,1],party));
A1s=V(value([1,1,0],party))+V(value([1,1,1],party));
B0s=V(value([2,0,0],party))+V(value([2,0,1],party));
B1s=V(value([2,1,0],party))+V(value([2,1,1],party));
C=[C,A0B0s==eta(1),A0B1s==eta(2),A1B0s==eta(3),A1B1s==eta(4)];% successful probability of joint probability
C=[C,A1s==sqrt(eta(1)),B0s==sqrt(eta(1)),B1s==sqrt(eta(1)),A0s==sqrt(eta(1))]; % successful probability of alice and bob is equavilent  

%% normalization is adjusted according to your chose of na,nb,nc. 
   %That is, writting out the last operator of every settings, which does not 
   %appear in the Gram matrix, is positive, such as A_x^{na}>=0)
 C=[C,1-V(value([0,1,0],party))>=0];% for eve normalization
 for ii=0:1
     for jj=0:1
        C=[C,1-V(value([ii,jj,0],party))-V(value([ii,jj,1],party))>=0];% for Alice Bob normalization
     end
 end


%% constraints for Gramm matrix  ( the following part is no need to do change,it's universal )
% the probabilities of A,B,AB are real values.
for ja=0:1
    for rr=0:na-1
        C=[C,real(V(value([1,ja,rr],party)))>=0,real(V(value([1,ja,rr],party)))<=1,imag(V(value([1,ja,rr],party)))==0];
        C=[C,real(V(value([2,ja,rr],party)))>=0,real(V(value([2,ja,rr],party)))<=1,imag(V(value([2,ja,rr],party)))==0];
       for rb=0:nb-1
           for jb=0:1
               C=[C,real(V(value([1,ja,rr;2,jb,rb],party)))>=0,real(V(value([1,ja,rr;2,jb,rb],party)))<=1,imag(V(value([1,ja,rr;2,jb,rb],party)))==0];
           end
       end       
    end
end
% the probabilities of E, AE,BE,ABE are real values.
 for rE=0:nc-1
     C=[C,real(V(value([0,1,rE],party)))>=0,imag(V(value([0,1,rE],party)))==0];       
     for rr=0:na-1
         for ja=0:1
             for jb=0:1
                 for rb=0:nb-1
                     C=[C,real(V(value([0,1,rE;1,ja,rr],party)))>=0,real(V(value([0,1,rE;1,ja,rr],party)))<=1,imag(V(value([0,1,rE;1,ja,rr],party)))==0];
                     C=[C,real(V(value([0,1,rE;2,ja,rr],party)))>=0,real(V(value([0,1,rE;2,ja,rr],party)))<=1,imag(V(value([0,1,rE;2,ja,rr],party)))==0];
                     C=[C,real(V(value([0,1,rE;1,ja,rr;2,jb,rb],party)))>=0,real(V(value([0,1,rE;1,ja,rr;2,jb,rb],party)))>=0,imag(V(value([0,1,rE;1,ja,rr;2,jb,rb],party)))>=0];
                 end
             end
         end
      end       
 end
  C=[C,V(1)==0,V(2)==1];% V(2)=tr(I)=1,V(1)is related to the orthogonal of the two projectors of the same setting.
for i=1:1:length(party)
    C=[C,real(V(i))>=-1];
    C=[C,real(V(i))<=1];
end
for i=1:1:length(T)
   for j=i:1:length(T)
       C=[C,G(i,j)==V(B(i,j))];
   end
end                 
C=[C,G>=0] ;    
optimize(C,objAE,ops) ;
Gram=double(G)
P=-double(objAE)
log2(P)
end
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
