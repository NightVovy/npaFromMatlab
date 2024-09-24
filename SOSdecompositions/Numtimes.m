function [CoeM] = Numtimes(As,Bt)
%Êı×Ö¾ØÕó
r=size(As,2);c=size(Bt,2);
CoeM=zeros(r,c);
for s=1:r
    for t=1:c
        CoeM(s,t)=As(1,s)*Bt(1,t);   %ÏµÊı¾ØÕó
    end
end

end

