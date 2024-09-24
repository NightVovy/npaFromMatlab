function [out3,out4]= matrixtoV( in3 ) %筛选 矩阵中的元素换成变量
G=in3;
% [r,c]=size(G);
% G1=cell(r,c);
% for e=1:r
%     for f=1:c
%         G1{e,f}=checktrans(G{e,f});
%     end
% end
% G1


% d=length(uniquecell(G));%提出重复元素之后的 元胞组长度，即元素种类个数
% U=cell(d,1);%定义一个与单一元素种类相同长度的元胞组
U=uniquecell(G);%放置单一的元素
 [r c] = size(U);
 idx=[];
 g=0;
for h=2:r
    if (size(U{h,1},1)>1)
             l=0;
         for z=1:size(U{h,1},1)-1
             if (U{h,1}(z,1)==U{h,1}(z+1,1))%如果U{,1}的第一列第t行的元素=第一列第t+1列的元素
               l=l+1;
               g=g+1;
               idx = [h];
               L{:,:,g}=U{h,1};%L(r)用来存放这样的矩阵
                  U{idx}=[];
                 break
             end
         end
         if (l==0)
             U{h,1}=numtostr(U{h,1});
         end
    else
        U{h,1}=numtostr(U{h,1});
    end
end
V=cell(1,g); %定义一个Cell存储这个矩阵
for p=1:g
    V{1,p}=numtostr(L{:,:,p});   
end
U(cellfun(@isempty,U))=[];

out3=U;
out4=V;

fid=fopen('U.txt','w');%存入文本
U{1,1}=1;
for j=1:size(U,1)
    fprintf(fid,'%s\n',U{j,1});
end
fclose(fid);
% celldisp(V)
% vmattovnum(V);
% celldisp(U)
end


