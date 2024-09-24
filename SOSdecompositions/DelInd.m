function [A] = DelInd( A )
%去掉相乘后多项式中的I,I is presented by [9 0]
%
 r=size(A,1);
 ind=[];
j=1;
 while (j<r+1)
         if(A(j,1)==9)   
       ind=[ind j ];
         end
        j=j+1;
        
 end
  A(ind,:)=[];
 out1=A;
end


