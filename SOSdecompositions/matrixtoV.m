function [out3,out4]= matrixtoV( in3 ) %ɸѡ �����е�Ԫ�ػ��ɱ���
G=in3;
% [r,c]=size(G);
% G1=cell(r,c);
% for e=1:r
%     for f=1:c
%         G1{e,f}=checktrans(G{e,f});
%     end
% end
% G1


% d=length(uniquecell(G));%����ظ�Ԫ��֮��� Ԫ���鳤�ȣ���Ԫ���������
% U=cell(d,1);%����һ���뵥һԪ��������ͬ���ȵ�Ԫ����
U=uniquecell(G);%���õ�һ��Ԫ��
 [r c] = size(U);
 idx=[];
 g=0;
for h=2:r
    if (size(U{h,1},1)>1)
             l=0;
         for z=1:size(U{h,1},1)-1
             if (U{h,1}(z,1)==U{h,1}(z+1,1))%���U{,1}�ĵ�һ�е�t�е�Ԫ��=��һ�е�t+1�е�Ԫ��
               l=l+1;
               g=g+1;
               idx = [h];
               L{:,:,g}=U{h,1};%L(r)������������ľ���
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
V=cell(1,g); %����һ��Cell�洢�������
for p=1:g
    V{1,p}=numtostr(L{:,:,p});   
end
U(cellfun(@isempty,U))=[];

out3=U;
out4=V;

fid=fopen('U.txt','w');%�����ı�
U{1,1}=1;
for j=1:size(U,1)
    fprintf(fid,'%s\n',U{j,1});
end
fclose(fid);
% celldisp(V)
% vmattovnum(V);
% celldisp(U)
end


