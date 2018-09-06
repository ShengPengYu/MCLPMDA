function overallauc=Fpositiontooverallauc(Y,HMDD,fcv_position)

[n,m]=size(Y);
A=HMDD ;
[pp,qq]=size(A);

for k=1:m*n-floor(pp/5)*4
    tp=0;
    for t=1:pp
        if fcv_position(1,t)<=k
            tp=tp+1;
        end
    end
    tpr(1,k)=tp/pp;
    if k<m*n-pp+floor(pp/5)+1
    fp=k*pp-tp;
    else fp=floor(pp/5)*4*(m*n-pp+floor(pp/5))+(pp-floor(pp/5)*4)*k-tp;
    end
     fpr(1,k)=fp/(floor(pp/5)*4*(m*n-pp+floor(pp/5)-1)+(pp-floor(pp/5)*4)*(m*n-floor(pp/5)*4-1));
end
  

    
%plot(fpr,tpr)

clear area;
area(1,1)=tpr(1,1)*fpr(1,1)/2;
for k=2:m*n-floor(pp/5)*4
    area(1,k)=[tpr(1,k-1)+tpr(1,k)]*[fpr(1,k)-fpr(1,k-1)]/2;
end
overallauc=sum(area);
end
          


