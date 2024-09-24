function out = toText(in)
% cell to string

[m, n] = size(in);

out = [];

for ii=1:m % row
    for jj=1:n % column
        out = [out in{ii,jj} ' '];
    end
    out = [out sprintf('; \n')];
    
end