function out1= generateQ1(m,n )%产生Q1集合
Q1=cell(1,m*n+1);% Q1 长度为1的集合元素个数 +1 是因为多一个单位元
Q1{1,1}=1;
x=1;
for j=1:m;%测量个数
    for k=1:n;%输出结果个数
        x=x+1;
        Q1{1,x}=[j k];
%     Q1{1,(j-1)*n+k+1}=[j k]
    end
end
out1=Q1;
fid=fopen('Q1.txt','w');%存入文本
for j=2:x
    Q1{1,j}=numtostr(Q1{1,j});
    fprintf(fid,'%s\n',Q1{1,j});
end
fclose(fid);
end

