function out1 = eqmatstr( in1 )%���ԳƵ���ֵ�����Ϊ�Գ��ַ�����
A=in1;
[r,c]=size(A);
G1=cell(r,c);
for e=1:r
    for f=1:c
        G1{e,f}=checktrans(A{e,f});%��������ת����ȵ�����滻
    end
end


G2=cell(r,c);
 for e=1:r
     for f=1:c
         if (e~=f)
             G2{e,f}=numtostr(G1{e,f});
         else
             G2{e,f}=num2str(G1{e,f});
         end
     end
 end
out1=G2;

end
