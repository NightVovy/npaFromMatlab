function out1 = judgereplace( in1 )%判断矩阵中的转置相等项并替换
A=in1;
[r,c]=size(A);
G1=cell(r,c);
for e=1:r
    for f=1:c
        G1{e,f}=checktrans(A{e,f});
    end
end
out1=G1;
end

