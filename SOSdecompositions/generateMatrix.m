function out1 = generateMatrix(in1)
% description of your function ��ĺ����Ǹ�ʲô��

    %A=[2 1;1 2 ;2 2;2 2;2 2];
    A = in1;
    % �������
    A=sortrows(A,1);%����һ������
    [r c] = size(A);
    idx = [];
    j=1;

    while (j<r)
        
        if (all(A(j,:)==A(j+1,:)))
            idx = [idx j j+1];
            j = j+2;
        else
            j =j+1;
        end
        
    end
    A(idx,:)=[];
  
out1=A;

%     str1=[];
%     for i=1:size(A,1)
%         str1=[str1 char(A(i,1)+64) num2str(A(i,2))];
%     end
% 
%     out1 = str1;

end
