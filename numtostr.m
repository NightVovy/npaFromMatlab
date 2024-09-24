functin out2=mumtostr(in2)
%将矩阵数值转字母表示
A=in2;%输入矩阵
[r c]=size(A);
strl=[];
for i=1:size(A,1)
    strl=[str1 char(A(i,1)+64) num2str(A(i,2))];
end
out2=str1;
end