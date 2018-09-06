function [kd,km] = GaussianKernel(interaction,gamadd,gamall)
[nd,nm]=size(interaction);
%calculate gamad for Gaussian kernel calculation
for i=1:nd
    sd(i)=norm(interaction(i,:))^2;
end
gamad=nd/sum(sd')*gamadd;

%calculate gamal for Gaussian kernel calculation
for i=1:nm
    sl(i)=norm(interaction(:,i))^2;
end
gamal=nm/sum(sl')*gamall;

%calculate Gaussian kernel for the similarity between disease: kd
for i=1:nd
    for j=1:nd
        kd(i,j)=exp(-gamad*(norm(interaction(i,:)-interaction(j,:)))^2);
    end
end

%calculate Gaussian kernel for the similarity between microbe: km
for i=1:nm
    for j=1:nm
        km(i,j)=exp(-gamal*(norm(interaction(:,i)-interaction(:,j)))^2);
    end
end


end