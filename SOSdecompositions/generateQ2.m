function  out2 = generateQ2(m,n )
Q2=cell(1,1/2*n*(-2*m+m*n+m^2*n));% m 方参与，每方有n个测量
y=0;
for s=1:m;
    for t=1:n;
        for u=1:m;
            for v=1:n;
                    if (s==u&&t==v||s>u)
                     continue               
                    end
                    y=y+1;   
                     Q2{1,y}=[[s t];[u v]];
            end
        end
    end
end
out2=Q2;
fid=fopen('Q2.txt','w');%存入文本
for j=1:y
    Q2{1,j}=numtostr(Q2{1,j});
    fprintf(fid,'%s\n',Q2{1,j});
end
fclose(fid);
end

