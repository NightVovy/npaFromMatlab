
clear;
clc;
C1=cell(8,8);
for s=1:4 
    for t=1:4
        C1{s,t}='(1+A1)/2';
    end
end
for s=1:4
    for t=5:8
        C1{s,t}='(A2+A2A1-A1A2-A1A2A1)/4';
    end
end
for s=5:8
    for t=1:4
        C1{s,t}='(A2-A2A1+A1A2-A1A2A1)/4';
    end
end
for s=5:8
    for t=5:8
        C1{s,t}='(1-A1)/2';
    end
end
C2=cell(8,8);
arrary1=[1 2 5 6];
arrary2=[3 4 7 8];
for s=arrary1
    for t=arrary1
        C2{s,t}='(1+B1)/2';
    end
    for t=arrary2
        C2{s,t}='(B2+B2B1-B1B2-B1B2B1)/4';
    end
end
for s=arrary2
    for t=arrary1
        C2{s,t}='(B2-B2B1+B1B2-B1B2B1)/4';
    end
    for t=arrary2
        C2{s,t}='(1-B1)/2';
    end
end
C3=cell(8,8);
arrary3=[1 3 5 7];
arrary4=[2 4 6 8];
for s=arrary3
    for t=arrary3
        C3{s,t}='(1+C1)/2';
    end
    for t=arrary4
        C3{s,t}='(C2+C2C1-C1C2-C1C2C1)/4';
    end
end
for s=arrary4
    for t=arrary3
        C3{s,t}='(C2-C2C1+C1C2-C1C2C1)/4';
    end
    for t=arrary4
        C3{s,t}='(1-C1)/2';
    end
end

C=cell(8,8);
for s=1:8
    for t=1:8
        C{s,t}=strcat(C1{s,t},'*',C2{s,t},'*',C3{s,t});
    end
end
C
%%
a=[1 0]';
b=[0 1]';
I=[1 0;0 1];
X=[0 1;1 0];
Z=[1 0;0 -1];
Y=[0 -1i;1i 0];

U=cos(pi/4-pi/8)*I-1i*sin(pi/4-pi/8)*Y;

% 
% U=[cos(u/2) sin(u/2);-sin(u/2) cos(u/2)];
% U=[cos(pi/8) -sin(pi/8);sin(pi/8) cos(pi/8)];

W=1/sqrt(3)*(superkron(a,a,b)+superkron(a,b,a)+superkron(b,a,a));
W1=superkron(U,U,U)*W;
 F=expand(W1'*cell2sym(C)*W1)

A1=cos(pi/4)*Z+sin(pi/4)*X;
A2=cos(-pi/4)*Z+sin(-pi/4)*X;
B1=cos(pi/4)*Z+sin(pi/4)*X;
B2=cos(-pi/4)*Z+sin(-pi/4)*X;
C1=cos(pi/4)*Z+sin(pi/4)*X;
C2=cos(-pi/4)*Z+sin(-pi/4)*X;
UA1=U*A1*U';
UA2=U*A2*U';
A1=Z;A2=X;
B1=Z;B2=X;
C1=Z;C2=X;




M3=superkron(A1,B1,I)+superkron(A1,I,C1)+superkron(I,B1,C1);
M4=superkron(A1,B2,I)+superkron(A2,B1,I)+superkron(A1,I,C2)+superkron(A2,I,C1)+superkron(I,B1,C2)+superkron(I,B2,C1);
M5=superkron(A2,B2,I)+superkron(A2,I,C2)+superkron(I,B2,C2);
M6=superkron(A1,B1,C1);
M7=superkron(A1,B1,C2)+superkron(A1,B2,C1)+superkron(A2,B1,C1);
M8=superkron(A1,B2,C2)+superkron(A2,B1,C2)+superkron(A2,B2,C1);
M9=superkron(A2,B2,C2);
B=-M3-2*M4-M5+3/(2*sqrt(2))*M6-1/(2*sqrt(2))*M7-1/(2*sqrt(2))*M8+3/(2*sqrt(2))*M9;

%%




