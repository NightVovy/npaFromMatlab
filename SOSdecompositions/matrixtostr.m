function out1 = matrixtostr( in1)%将最后识别的数矩阵换成字符矩阵
G1=in1;
[r,c]=size(G1);
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
out1=G2

end

