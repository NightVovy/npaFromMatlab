function out = generateQ3(m,n )%��������Ϊ3��������
Q1=generateQ1(m,n);
Q2=generateQ2(m,n);
[~,c1]=size(Q1);
[~,c2]=size(Q2);
Q30=cell(1,c1*c2);
g=0;

for e=2:c1%ȥ�� Q1�еĵ�һ��Ԫ��1
        for f=1:c2
            if(size(generateMatrix([Q1{1,e};Q2{1,f}]),1)==3)%ֻȡά�ȵ������ľ���Ԫ��
                g=g+1;
                Q30{1,g}=generateMatrix([Q1{1,e};Q2{1,f}]);
            end
        end
end
g;
Q30(cellfun(@isempty,Q30))=[];
d=size(uniquecell(Q30),2);
Q3=uniquecell(Q30);%���õ�һ��Ԫ��
out=Q3;

fid=fopen('Q3.txt','w');%�����ı�
for j=1:d
    Q3{1,j}=numtostr(Q3{1,j});
    fprintf(fid,'%s\n',Q3{1,j});
end
fclose(fid);
end

