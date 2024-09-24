%%Sum-of-squares decompositions theta=pi/8;beta= 2/sqrt(3)  ;alpha=1;
function fig=(v)
v=1;
syms x y z
M=cell(5,5);
M{1,1}=x;  M{1,2}=-1/sqrt(2);  M{1,3}=3/sqrt(2)*y; M{1,4}=0; M{1,5}=0;
M{2,2}=5/3-x+y/2;  M{2,3}=1/3-2*y; M{2,4}=0; M{2,5}=0;
M{3,3}=2+3*y-z; M{3,4}=0; M{3,5}=0; 
M{4,4}=z; M{4,5}=-sqrt(2)/3-sqrt(2)*y;
M{5,5}=2/3-y;
for jj=1:5
    for ii=1:5
        if (jj<ii)
            M{ii,jj}=M{jj,ii};
        end
    end
end
M
M1=cell2sym(M)%论文19式 M
%%
%论文Fig2 code
% x=0:0.01:2;
% y=-0.4:0.01:0.4;
% z=0:0.01:3;
x=0:1:2;
y=-0.4:0.1:0.4;
z=0:1:3;


[x,y,z] = meshgrid(x,y,z);
f = {@(x,y,z)-(y/2 - x + 5/3)...
@(x,y,z)-(3*y - z + 2)...   
@(x,y,z)-(2/3 - y)...
@(x,y,z)-((5*x)/3 + (x.*y)/2 - x.^2 - 1/2)...
@(x,y,z)-(2*x + 3*x.*y - x.*z - (9*y.^2)/2)...
@(x,y,z)-((22*y)/3 - 2*x - (5*z)/3 - 3*x.*y + x.*z - (y.*z)/2 - (5*y.^2)/2 + 29/9)...
@(x,y,z)-((2*z)/3 - (4*y)/3 - y.*z - 2*y.^2 - 2/9)...
@(x,y,z)-((29*x)/9 - (5*y)/2 + z/2 + (22*x.*y)/3 - (5*x.*z)/3 + 2*x.*y.^2 - 3*y.*x.^2 + z.*x.^2 - 2*x.^2 - (3*y.^2)/2 - (9*y.^3)/4 - (x.*y.*z)/2 - 1)};


c = f{1}(x,y,z);
for i =2:numel(f)% 2:3 %2:numel(f)
    c = max(c, f{i}(x,y,z)) % c is the extrme point? I think this is used for the figure plotting.
end
p = patch(isosurface(x,y,z,c,0));
isonormals(x,y,z,c,p)
set(p,'facecolor',[0 .5 1],'edgecolor','none')
view(150,30),axis image,grid on
camlight
lighting gouraud
end