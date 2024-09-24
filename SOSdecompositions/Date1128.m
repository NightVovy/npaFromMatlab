x=[1/2:0.02:0.9];
for ii=1:size(x,2)
    P=x(ii);
    k=1;%2*(1-P)^2/P^2-0.1;
    %   %P=1/4;
    %beta=2*k*P/(1-2*P);alpha=2*P/(1-2*P);
    beta=k*P/(1-P);alpha=P/(1-P);
    L(ii)=beta+2*alpha;
    Q(ii)=sqrt((1+beta^2)*(4+alpha^2));
end

