function out6=mvterrepstrv( in6,in7 )
  %�Աȱ������󼯺ϣ��������еı����滻Ϊ�ַ�����
A=in6;
B=in7;
[r,c]=size(A);
C=cell(r,c);
for i=1:r
    for j=1:c
       for p=1:size(B,2)
           if(strcmp(A{i,j},B{1,p}))
               A{i,j}=['v(',num2str(p) ')'];
%     A=strrep(A,B(1,p),['V',num2str(p)])
           end
       end
    end
end

for i=1:r
   for j=1:c
       C{i,j}=A{i,j};
   end
end
out6=C;
% fid=fopen('C.txt','w');%�����ı�
% for e=1:r
% %     for f=1:c
%        fprintf(fid,'%s',C{e,:});
%        fprintf(fid,'\n');
%      
% %     end
% end
%     fclose(fid);
end

