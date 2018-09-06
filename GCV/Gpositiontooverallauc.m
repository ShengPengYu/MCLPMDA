function overallauc=Gpositiontooverallauc(Y,HMDD,globalposition)

[n,m]=size(Y);
[pp,~]=size(HMDD);


for i=1:pp
if globalposition(i)>m*n-pp+1
globalposition(i)=m*n-pp+1;
end 
end    
for k=1:m*n-pp+1
    tp=0;
    for t=1:pp
        if globalposition(1,t)<=k
            tp=tp+1;
        end
    end
    tpr(1,k)=tp/pp;
    
    fp=k*pp-tp;
    fpr(1,k)=fp/(pp*(m*n-pp));
end
%plot(fpr,tpr)
clear area;
area(1,1)=tpr(1,1)*fpr(1,1)/2;
for k=2:m*n-pp+1 
    area(1,k)=[tpr(1,k-1)+tpr(1,k)]*[fpr(1,k)-fpr(1,k-1)]/2;
end
overallauc=sum(area);
end
          
