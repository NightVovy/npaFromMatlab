function out6 = checktrans(in5 )%识别转置相等
A=sortrows(in5,1);

[r c]=size(A);
B=sortrows(flipud(A),1);
F=A;
if (A==B)
    F=A;
else 
    for j=1:r
        if (B(j,2)~=A(j,2))
           j;
            break
        end
    end
    if (B(j,2)<A(j,2))
        F=B;
       else F=A;
    end
            
end   
  out6=F;
end

