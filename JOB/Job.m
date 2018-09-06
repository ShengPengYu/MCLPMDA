function [F] = Job(AD, AM, Y,gama,beta)
% AD£∫the disease-disease similarity matrix
% AM: the miRNA-miRNA similarity matrix
% Y : the ground truth (the known disease-miRNA associations)
% F : the result predicted by our method

%  πÈ“ªªØ
M=sum(AM);
for i=1:495
    for j=1:495
        AM(i,j)=AM(i,j)/(((M(i)*M(j))^0.5));
    end
end

D=sum(AD);
for i=1:383
    for j=1:383
        AD(i,j)=AD(i,j)/(((D(i)*D(j))^0.5));
    end
end

%prediction from miRNA space
if nargin < 3
    gama=0.95;
    beta = 0.6; 
end


PT=Y';
PT0=Y;
P0=Y';
k= 0;
delta = 1;

while  (delta > 1e-6)
    PT1 = (1-gama)*AM*PT+gama*P0;
    delta =abs(sum(sum((abs(PT1)-abs(PT)))));
    PT = PT1;
    k= k + 1;
end

%prediction from Disease space
delta = 1;
while  (delta > 1e-6)
    DD = (1-gama)*AD*PT0+gama*P0';
    delta =abs(sum(sum((abs(DD)-abs(PT0)))));
    PT0 =DD;
    k= k + 1;
end
F=(beta*PT1+(1-beta)*DD')';
end


