function [ out ] = symmetryQ1( m,n )
%Q-local1产生的行，m=party n=measurment
Q1=cell(1,3);% is an N by N cell array of empty matrices.
Q2=cell(1,3);

Q1{1,1}=[9 0];% ? why use [9,0] to represent identity.
Q2{1,1}=[9 0];
n=2;
x=1;
for j=0:n-1
    x=x+1;
    Q1{1,x}=[1,j];
end
y=1;
for j=0:n-1
    y=y+1;
    Q2{1,y}=[2,j];
end

Q=cell(1,9);
j=0;
    for s=1:n+1
        for t=1:n+1
                j=j+1;    
                Q{1,j}=[Q1{1,s};Q2{1,t}];

        end
    end
Q;

Q{1,1}=1;
for j=2:9
    Q{1,j}=DelInd(Q{1,j});
end

out=Q;
fid=fopen('Q.txt','w');%存入文本
for j=2:9
    Q{1,j}=numtostr(Q{1,j});
    fprintf(fid,'%s\n',Q{1,j});
end
fclose(fid);


end

