function out1 = nummtostrm( in1 )%���ԳƵ���ֵ�����Ϊ�Գ��ַ�����
A=in1;
[r,c]=size(A);


G2=cell(r,c);%cell(M,N) or cell([M,N]) is an M-by-N cell array of empty matrices.
 for e=1:r
     for f=1:c
         if (e~=f)
             G2{e,f}=numtostr(A{e,f});%��������ֵת��ĸ��ʾ
         else
             G2{e,f}=num2str(A{e,f});%Convert numbers to character representation
         end
     end
 end
out1=G2;

end

