clear;
clc;

%test for free will
G=generateQ(2,2);
G0=nummtostrm(G);  
%%
G1=judgereplace(G);
G2=eqmatstr(G);
[U,V]=matrixtoV(G1);
G3=mvterrepstrv(G2,V);
r1=size(U,1);
r2=size(V,2);

%    for ii=1:10

u=sdpvar(1,r1);
v=sdpvar(1,r2);

for i=2:r1
    cmd1 = [U{i,1} '=u(i);'];
    eval(cmd1);
end

str1 = ['M = [' toText(G3) '];'] ; 
eval(str1)
%%

f=['1/4 + (A1B1)/(4*sqrt(2))-(A1A2A1B1)/(8*sqrt(2))+(A2B1)/(8*sqrt(2))-(A1A2B1B2)/16+(A2A1B1B2)/16-'...
    '(A1B1B2B1)/(8*sqrt(2))-(A1A2A1B1B2B1)/(16*sqrt(2))+(A2B1B2B1)/(16*sqrt(2))+(A1B2)/(8*sqrt(2))+'...
    '(A1A2A1B2)/(16*sqrt(2))-(A2B2)/(16*sqrt(2))+ (A1A2B2B1)/16-(A2A1B2B1)/16'];%fidelity function

% %Bell= 2+(2*sqrt(2)-2)/20*ii;
% epsilon=0.1/20*(ii-1);
%Violation=[2.80524750888695  2.79751403490735  2.79799843579731 2.82195045399820 2.76321951198123 2.80444347811965 2.79941919667797 2.77175050923151 2.78362757342081 2.80418042180249];
%uideal=[1 0 0 1/sqrt(2) 1/sqrt(2) 1/sqrt(2) -1/sqrt(2) 0 0]*(1-0.1);
%u(2:9)==uideal(2:9)


%obj=eval(objfunction(f));



alpha=1;

%Bell1=alpha*A1+A1B1+A1B2+A2B1-A2B2;
 %Bell2=alpha*A1+A1B3+A1B4-A3B3+A3B4;
% Bell3=alpha*A2+A2B5+A2B6-A3B5+A3B6;
 Bell2=alpha*A2+A1B1+A1B2-A2B1+A2B2;
% Bell3=alpha*A2+A2B5+A2B6-A3B5+A3B6;
obj=Bell2

%obj=alpha*A1+A1B1+A1B2-A2B1+A2B2;

F = [M>=0; u<=1; u>=-1,v>=-1;v<=1;];%)v(6)==(P(2)-P(1))/(2*P(3))
%
sol = optimize(F,-obj);
obj=double(obj)
% minF(ii)=double(obj)
%  end
% 

 sqrt(8+2*alpha^2)

 
 






