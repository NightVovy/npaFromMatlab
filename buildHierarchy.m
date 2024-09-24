  function [M] = buildHierarchy(Q,na_in,na,nb_in,nb,nc_in,nc)

% build the NPA matrix
%  Alice 2 measurements each has na+1 outcomes 
%  Bob 2 measurements,each has na+1 outcomes   
%  Eve 1 measurement, has nc+1 outcomes
% 测量次数na_in， 测量输出结果na个（还是na+1个？）

op{1} = [0 0 0]; % identity
for ia=0:na_in-1
    for ja=0:na-1
        t=length(op);
        op{t+1} = [1 ia ja]; % A operator
    end 
end

for ib=0:nb_in-1
    for jb=0:nb-1
        t=length(op);
        op{t+1} = [2 ib jb]; % B operator
    end 
end

% for jc=1:nc_in
% for je=0:nc-1
%     t=length(op);
%     op{t+1} = [0 jc je]; % E operator
% end 
% end

if Q==2
    %% AB operators
% op{10} = [1 0 0; 2 0 0]; % A0B0 operator for ja=0, ra=0, jb=0, rb=0
for ja=0:na_in-1
    for ra=0:na-1
        for jb=0:na_in-1
            for rb=0:nb-1               
                t=length(op);
                op{t+1} = [1 ja ra;2 jb rb]; % A0B0
            end
        end
    end
end
%      %% AE  moment
%      i=1;
%        for jc=1:nc_in
%         for j=0:na_in-1
%             for k=0:na-1
%                 for m=0:nc-1
%                     t=length(op);
%                     op{t+1}=[i,j,k;0,jc,m];
%                 end 
%             end
%         end
%        end
%     %% BE moment
%      i=2;
%      for jc=1:nc_in
%         for j=0:nb_in-1
%             for k=0:nb-1
%                 for m=0:nc-1
%                     t=length(op);
%                     op{t+1}=[i,j,k;0,jc,m];
%                 end 
%             end
%         end
%      end
      %% A1A2 operators
%       
%       for ra=0:na-1
%           for rA=0:na-1
%               t=length(op);
%               op{t+1} = [1 0 ra;1 1 rA]; % A0A1
%           end
%       end
%       %% B1B2 operators
% 
%       for rb=0:nb-1
%           for rB=0:nb-1
%               t=length(op);
%               op{t+1} = [2 0 rb;2 1 rB]; % B0B1
%           end
%       end
     
%       %% E1E2 operators
%       for  jc=1:nc_in-1
%           for jC=jc+1:nc_in
%               for rc=0:nc-1
%                   for rC=0:nc-1
%                      t=length(op);
%                      op{t+1} = [0 jc rc;0 jC rC]; % E0E1
%                   end
%               end
%           end
%       end   
end

if Q==3
   %% AB operators
for ja=0:na_in-1
    for ra=0:na-1
        for jb=0:na_in-1
            for rb=0:nb-1               
                t=length(op);
                op{t+1} = [1 ja ra;2 jb rb]; % A0B0
            end
        end
    end
end
     %% AE  moment
     i=1;
       for jc=1:nc_in
        for j=0:na_in-1
            for k=0:na-1
                for m=0:nc-1
                    t=length(op);
                    op{t+1}=[i,j,k;0,jc,m];
                end 
            end
        end
       end
    %% BE moment
     i=2;
     for jc=1:nc_in
        for j=0:nb_in-1
            for k=0:nb-1
                for m=0:nc-1
                    t=length(op);
                    op{t+1}=[i,j,k;0,jc,m];
                end 
            end
        end
     end
      %% A1A2 operators
      
      for ra=0:na-1
          for rA=0:na-1
              t=length(op);
              op{t+1} = [1 0 ra;1 1 rA]; % A0A1
          end
      end
      %% B1B2 operators

      for rb=0:nb-1
          for rB=0:nb-1
              t=length(op);
              op{t+1} = [2 0 rb;2 1 rB]; % B0B1
          end
      end
     
      %% E1E2 operators
      for  jc=1:nc_in-1
          for jC=jc+1:nc_in
              for rc=0:nc-1
                  for rC=0:nc-1
                     t=length(op);
                     op{t+1} = [0 jc rc;0 jC rC]; % E0E1
                  end
              end
          end
      end   
    %% ABE operators
for ja=0:na_in-1
    for ra=0:na-1
        for jb=0:na_in-1
            for rb=0:nb-1  
                for jc=1:nc_in
                    for rc=0:nc-1
                        t=length(op);
                        op{t+1} = [1 ja ra;2 jb rb;0,jc,rc]; % A0B0E
                    end
                end
            end
        end
    end
end

%% AAB operators
    for ra=0:na-1
        for rA=0:na-1  
            for jb=1:nb_in-1
                for rb=0:nb-1
                    t=length(op);
                    op{t+1} = [1 0 ra;1 1 rA;2,jb,rb]; % AAB
                end
            end
        end
    end
%% AAE operators
    for ra=0:na-1
        for rA=0:na-1  
            for jc=1:nc_in
                for rc=0:nc-1
                    t=length(op);
                    op{t+1} = [1 0 ra;1 1 rA;0,jc,rc]; % AAE
                end
            end
        end
    end     
%% ABB operators
    for ja=0:na_in-1
        for ra=0:na-1  
            for jb=1:nb-1
                for rB=0:nb-1
                    t=length(op);
                    op{t+1} = [1 ja ra;2 0 rb;2,1,rB]; % ABB
                end
            end
        end
    end
%% BBE operators
    for rb=0:nb-1
        for rB=0:nb-1  
            for jc=1:nc_in
                for rc=0:nc-1
                    t=length(op);
                    op{t+1} = [2 0 rb;2 1 rB;0,jc,rc]; % BBE
                end
            end
        end
    end    
 %% AEE operators
    for ja=0:na_in-1
        for ra=0:na-1  
            for jc=1:nc_in-1
                for jC=jc+1:nc_in
                     for rc=0:nc-1
                         t=length(op);
                         op{t+1} = [1 ja ra;0 jc rc;0,jC,rc]; % AEE
                     end
                end
            end
        end
    end
%% BEE operators
    for jb=0:nb_in-1
        for rb=0:nb-1  
            for jc=1:nc_in-1
                for jC=jc+1:nc_in
                    for rc=0:nc-1
                        t=length(op);
                        op{t+1} = [2 jb rb;0 jc rc;0,jC,rc]; % BEE
                    end
                end
            end
        end
    end    
    
    
end
    








%% Hierarchy Grame matrix M
M = cell(length(op),length(op));%cell arbitary items
% 创建一个和op元素相等还要平方一下的单元格数组（op也是单元格数组）
% 其实op里的元素是矩阵，只不过是几乘几的区别

for ii = 1:length(op)
    for jj = ii:length(op)
        
        M{ii,jj} = simplifyProjectors([flipud(op{ii});op{jj}]); % flipud used to reverse op{ii}
        % 为什么要让矩阵上下颠倒？
        % 垂直拼接，opjj加在了颠倒后的opii后面
        % 简化后的结果填在了Miijj的位置
        % op{ii} = [1 0 0; 2 0 0]; flipud(op{ii}) = [2 0 0; 1 0 0];
        % op{jj} = [1 1 0; 2 1 0]; [flipud(op{ii}); op{jj}] = [2 0 0; 1 0 0; 1 1 0; 2 1 0];
        
    end
end

% symmetrize
% 对称化的目标是M{ii,jj} = M{jj,ii}
% 在对称化过程中，M{jj,ii} 已经在之前的循环中被计算和简化过了（在 M{ii,jj} 之前）
% flipud 用于确保上下翻转后的矩阵与原矩阵的对称性一致
for ii = 2:length(op)
    for jj = 1:ii
        
        M{ii,jj} = simplifyProjectors(flipud(M{jj,ii}));
        
    end
end

%% convert to text
% textM = cell(length(op));
% opMat=[];
% opMat(1,:)=[ -1, -1, -1,-1];
% opMat(2,:)=[ 0, 0 ,0, 0];
% 
% opStr=strings(2*nstate*(na+nb)+2+2*(na+nb));
% opStr(1)='0';
% opStr(2)='Id';
% 
% %output matrix
%  for i=0:1:nstate
%     for ina=1:1:na
%         tt=length(opMat(:,1))+1;
%         opMat(tt,:) = [0 ina-1  0 i]; % A^0_ina \psi_i
%         opMat(tt+1,:) = [0 ina-1  1 i ]; % A^1_ina \psi_i
%         opStr(tt)= strcat('A',num2str(ina),'_1X',num2str(i));
%         opStr(tt+1)=strcat('A',num2str(ina),'_2X',num2str(i));
%     end
%     for inb=1:1:nb
%         tt=length(opMat(:,1))+1;
%         opMat(tt,:) = [1 inb-1 0 i]; % B^0_inb \psi_i
%         opMat(tt+1,:) = [1 inb-1 1 i ]; % B^1_inb \psi_i
%         opStr(tt)=strcat('B',num2str(inb),'_1X',num2str(i));
%         opStr(tt+1)=strcat('B',num2str(inb),'_2X',num2str(i));
%     end
% end       
% %opStr = {'0' 'Id' 'A0X_1' 'A1' 'B0' 'B1',.......,A0B0X_n,...};
% length(opStr)
% length(opMat)
% for ii = 1:length(op)
%     for jj = 1:length(op)
%         
%         textM{ii,jj} = toText(M{ii,jj},opStr,opMat);
%     end
% end
% 
% y=M([2:length(M)],[2:length(M)]);
 end