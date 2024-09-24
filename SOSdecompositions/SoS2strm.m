function out1 = SOS2strm(A)
%将对称的数值矩阵变为对称字符矩阵
[r,c]=size(A);
G2=cell(r,c);
for e=1:r
    for f=1:c
        if (isequal(A{e,f},1)==1)
            G2{e,f}='1';
        else if (isequal(A{e,f},[9 0])==1)
                G2{e,f}='1';
            else
                
           G2{e,f}=numtostr(A{e,f});
            end            
        end
    end
    out1=G2;
    
end


