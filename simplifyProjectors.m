function out = simplifyProjectors(in)

% auxillary function to generate the NPA matrix
% "in" is a n-by-3 matrix (n*3)
% each row: [party input output]
% Then it is simplified according to the following rules:
% --- operator belong to different parties commute
% --- assume projectors: Ai_0Aj_0 = delta_ij Ai_0
% identity is denoted as [0 0 0]
% and zero is denoted as [-1 -1 -1];


out = [];
in = sortrows(in,1);%sort from minimum to maximum
% 行排序，按照矩阵in的第一列对行排序，从小到大，后续可以处理同party算符

% find parties
party = unique(in(:,1));%unigue,return all the different items in matrix, form a column
% 找到数组中的唯一值，in(:,1) 表示矩阵 in 的第一列。
% unique(in(:,1)) 返回第一列中所有不同的值，并将它们存储在向量 party 中


myFlag=0;
for iParty = 1:length(party)
    tmpParty = party(iParty); % party确实是从1开始的，不过...
    tmp1 = in(in(:,1) == tmpParty,:);%== return the rows which the fisrt itme equals to temparty
    % in(:,1) 表示矩阵 in 的第一列
    % in(:,1) == tmpParty 创建一个逻辑数组，标识 in 矩阵中第一列等于 tmpParty 的行
    % in(in(:,1) == tmpParty,:) 选择 in 矩阵中第一列等于 tmpParty 的所有行，并将这些行存储在 tmp1 中
    % 目的是提取属于当前 party 的所有行
    
    while true
        tmp2 = tmp1;
        for ii = 1:size(tmp2,1)-1% the length of the fist column
            % 遍历tmp2矩阵 从第一行遍历到倒数第二行？
            if tmp2(ii,2) == tmp2(ii+1,2) % 检查当前行和下一行的第二列是否相等
                if tmp2(ii,3) == tmp2(ii+1,3) % 检查当前行和下一行的第三列是否相等
                    % if same party same input same output相同party相同输入输出
                    % A0_0A0_0 = A0;
                    % identity = [0 0 0]; 下一行设置为单位算子
                    tmp2(ii+1,:) = [0 0 0]; 
                    
                else
                    % if same party same input different output
                    % 相同party相同输入不同输出
                    % A1_0A0_0 = 0;
                    % zero = [-1 -1 -1]; 把tmp设置为0算子, myflag设为1并结束循环
                    tmp2 = [-1 -1 -1];
                    myFlag = 1;
                    break;
                end
            end            
        end
        
           if size(tmp2,1) == size(tmp1,1) % always holds, to make sure break cover while circle
               break
           end
           tmp1 = tmp2;
           % 如果 tmp2 的行数与 tmp1 相同，则跳出 while 循环
           % 否则，将 tmp2 赋值给 tmp1，继续下一轮循环
    end
    
    if myFlag==1  % break cover while circle
       out = [-1 -1 -1]; 
       break
    end
            
       out = [out; tmp2];% out = [out; tmp2];将 tmp2 矩阵添加到 out 矩阵的末尾
end

out = sortrows(out,1);

% remove the identity [0 0 0]
tmpOut = out;
tmpOut(sum(tmpOut,2)==0,:) = [];%if there is a row with sum 0,then set this row empty
    % 移除 tmpOut 中所有行和为0的行
    % sum(tmpOut,2) 计算 tmpOut 矩阵每一行的和
    % sum(tmpOut,2)==0 创建一个逻辑数组，标识 tmpOut 中和为0的行
    % tmpOut(sum(tmpOut,2)==0,:) = []; 将这些和为0的行移除
    if isempty(tmpOut) % 如果 tmpOut 为空，则将 out 设置为 [0 0 0]
       out = [0 0 0];
    else
       out = tmpOut;

    end

end
 