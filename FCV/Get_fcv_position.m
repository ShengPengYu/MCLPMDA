function [fcvposition] = Get_fcv_position(dss,mfs,SD,SM,Y,HMDD,X,gamma,beta)
A=HMDD;
nd=size(SD,1);
nm=size(SM,1);

[pp,~]=size(A);

fcvposition = zeros(1,pp);

T=1;
for cv=1:5
    
    
    Y_temp = Y ;
    if cv<5
        B=A(X((cv-1)*floor(pp/5)+1:floor(pp/5)*cv),:);
        for i=1:floor(pp/5)
            Y_temp(B(i,1),B(i,2))=0;
        end
    else B=A(X((cv-1)*floor(pp/5)+1:pp),:);
        % obtain training sample
        for i=1:pp-floor(pp/5)*4
            Y_temp(B(i,1),B(i,2))=0;
        end
    end
    
    
    
    [KD,KM] = GaussianKernel(Y_temp,1,1);
    AD = IntegratedSimilarity(KD, SD,dss);
    AM = IntegratedSimilarity(KM, SM,mfs);
    
    F=Job(AD,AM,Y_temp,gamma,beta);
    [size1B,~]=size(B);
    % obtain the score of tested  disease-microbe interaction
    for i=1:size1B
        finalscore(i,1)=F(B(i,1),B(i,2));
    end
    % make the score of seed  disease-microbe interactions as zero
    for i=1:nd
        for j=1:nm
            if Y(i,j)==1
                F(i,j)=0;
            end
        end
    end
    for qq=1:size1B
        % obtain the position of tested disease-microbe interaction as variable position(1,cv),
        [ll1,~]=size(find(F>=finalscore(qq)));
        if(ll1==0)
            ll1=1;
        end
        [ll2,~]=size(find(F>finalscore(qq)));
        fcvposition(1,T)=ll2+1+(ll1-ll2-1)/2;
        T=T+1;
        
        str0 = sprintf('Experiment type        : Five fold cross validation');
        disp(str0);
        str3 = sprintf('Precicting score is    : %d',finalscore(qq));
        disp(str3);
        str = sprintf('The current ranking is : %d',fcvposition(1,T-1));
        disp(str);
        str4 = sprintf('\n');
        disp(str4);
    end
end
save('fcvposition.mat','fcvposition')

end






