function [uideal] = generateu(U,theta)
a=[1 0]';
b=[0 1]';

I=[1 0;0 1];
X=[0 1;1 0];
Z=[1 0;0 -1];
Y=[0 -1i;1i 0];
phi=cos(theta)*kron(a,a)+sin(theta)*kron(b,b);
eval(['A',num2str(1),'=Z;']); eval(['A',num2str(2),'=X;']);eval(['A',num2str(3),'=(Z+X)/sqrt(2);']);eval(['A',num2str(4),'=(X-Z)/sqrt(2);']);
eval(['B',num2str(1),'=Z;']); eval(['B',num2str(2),'=X;']);eval(['B',num2str(3),'=(Z+X)/sqrt(2);']);eval(['B',num2str(4),'=(Z-X)/sqrt(2);']);




[r,c]=size(U);
uideal=zeros(1,r);

party = {'A','B'};
for j=1:r
    opTemp = U{j}; % string
    Op = cell(1,2);
    for p = 1:length(party)
        if isempty(find(ismember(opTemp,party{p})))
            Op{p} = I;
        else
            % Op(p) = A0
%             Op{p} = eval([char(64+p) num2str(opTemp(p,2))]);
            indParty = strfind(opTemp,party{p});
            Op{p} = eval(opTemp(indParty:indParty+1));
        end
    end
    
    uideal(j) = phi'*superkron(Op{1},Op{2})*phi;
end    
%     
    out1=uideal;
end




