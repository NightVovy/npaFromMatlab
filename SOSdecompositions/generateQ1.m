function out1= generateQ1(m,n )%����Q1����
Q1=cell(1,m*n+1);% Q1 ����Ϊ1�ļ���Ԫ�ظ��� +1 ����Ϊ��һ����λԪ
Q1{1,1}=1;
x=1;
for j=1:m;%��������
    for k=1:n;%����������
        x=x+1;
        Q1{1,x}=[j k];
%     Q1{1,(j-1)*n+k+1}=[j k]
    end
end
out1=Q1;
fid=fopen('Q1.txt','w');%�����ı�
for j=2:x
    Q1{1,j}=numtostr(Q1{1,j});
    fprintf(fid,'%s\n',Q1{1,j});
end
fclose(fid);
end

