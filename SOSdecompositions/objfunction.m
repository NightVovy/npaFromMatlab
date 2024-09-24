function [output] = objfunction(f)
%将目标函数转换成矩阵中的元素
%   
G=generateQ(2,2);
G0=nummtostrm(G);  

C=cell(1,13);
C{1,1}='A1B1';
C{1,2}='A1A2A1B1';
C{1,3}='A2B1';
C{1,4}='A1A2B1B2';
C{1,5}='A2A1B1B2';
C{1,6}='A1B1B2B1';
C{1,7}='A1A2A1B1B2B1';
C{1,8}='A2B1B2B1';
C{1,9}='A1B2';
C{1,10}='A1A2A1B2';
C{1,11}='A2B2';
C{1,12}='A1A2B2B1';
C{1,13}='A2A1B2B1';


for j=1:13
        I(j)=find(ismember(G0,C{1,j}),1);
    end
 R=cell(1,13);
  for j=1:13
    R{1,j}= ['M(' num2str(I(j)) ')'];
  end

for j=1:13
    f=regexprep(f,['\(' C{1,j} '\)'], R{1,j} );
end

output= f;
end

