function out1 = nummtostrm( in1 )%将对称的数值矩阵变为对称字符矩阵
A=in1;
[r,c]=size(A);


G2=cell(r,c);%cell(M,N) or cell([M,N]) is an M-by-N cell array of empty matrices.
 for e=1:r
     for f=1:c
         if (e~=f)
             G2{e,f}=numtostr(A{e,f});%将矩阵数值转字母表示
         else
             G2{e,f}=num2str(A{e,f});%Convert numbers to character representation
         end
     end
 end
out1=G2;

end

