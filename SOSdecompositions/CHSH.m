clear
% for A0 A1.... A1B1 observable 
u = sdpvar(1,8);
% for v1 v2 variable
v = sdpvar(1,2);

A0 = u(1);
A1 = u(2);
B0 = u(3);
B1 = u(4);
A0B0 = u(5);
A0B1 = u(6);
A1B0 = u(7);
A1B1 = u(8);


% constuct moment matrix
G=[ 1   A0  A1      B0      B1;
    A0   1  v(1)    A0B0    A0B1;
    A1  v(1) 1      A1B0    A1B1;
    B0  A0B0 A1B0   1       v(2);
    B1  A0B1 A1B1   v(2)    1];

% objective


obj = (A0B0+A0B1+A1B0-A1B1);
% % constraints
 F = [G>=0; u<=1; u>=-1;v>=-1;v<=1];

% solve
sol = optimize(F,-obj);

double(obj)


%dualM=double(dual(F(1)))