function G = generateQ(m,n)%产生矩阵
A=symmetryQ1(m,n);
Q=cell(1,9);
Q{1,1}=1;
for j=2:9
    Q{1,j}=A{1,j};
end
 
    
P=cell(9,1);%矩阵第一列向量
P{1,1}=1;
for r=2:9
P{r,1}=flipud(Q{1,r});% 矩阵上下翻转;???????
end
%需要矩阵的字母表达形式
G=cell(9,9);%设置一个(x+y)*(x+y)的元胞组 
G{1,1}=1;
for e=2:9
    for f=2:9
        G{e,1}= P{e,1};
        G{1,f}=Q{1,f};
        if (e==f)
            G{e,f}=1;
           else
            G{e,f}=generateMatrix(generateMatrix([P{e,1};Q{1,f}]));
        end
    end
end
for e=2:9
    G{e,1}=sortrows(P{e,1},1);
end

out3=G;
end

