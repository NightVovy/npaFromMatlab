function [W0] = Times(As,Bt)
%产生字符矩阵

% R2{1,1}=[9 0];R2{1,2}=[1 0;2 0];R2{1,3}=[1 0;2 1];
% R3{1,1}=[9 0];R3{1,2}=[1 1;2 0];R3{1,3}=[1 1;2 1];
% As=R2;Bt=R3;
r=size(As,2);
c=size(Bt,2);
% for s=1:c 
%     Bt{s,1}=flipud(Bt{1,s});%产生列
% end
 %Rv=As;%产生行
W=cell(r,c);
for ii=1:r
    for jj=1:c
         W{ii,jj}=sortrows([As{1,ii};Bt{1,jj}],1);  
    end
end

for ii=1:r
    for jj=1:c
        if (size(W{ii,jj},1)==2&W{ii,jj}(1,:)==W{ii,jj}(2,:))
            W{ii,jj}=1;
        else
            W{ii,jj}=generateMatrix(generateMatrix(W{ii,jj}));  %相乘项
        end
    end
end


for ii=1:r
    for jj=1:c
         if(isempty(W{ii,jj})==1)
             W{ii,jj}=[9 0];
         else
        W{ii,jj}=DelInd(W{ii,jj});
         end
     end
end


W0=SoS2strm(W); %字符矩阵

end

