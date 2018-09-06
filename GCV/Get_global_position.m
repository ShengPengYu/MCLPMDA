function [globalposition] = Get_global_position(dss,mfs,SD,SM,Y,HMDD,gamma,beta)
    A=HMDD;
    nd=size(SD,1); 
    nm=size(SM,1);
    
    [pp,~]=size(A);
    globalposition = zeros(1,pp);
    for cv=1:pp
        PY = Y ;
        PY(A(cv,1),A(cv,2))=0;
        
       [KD,KM] = GaussianKernel(PY,1,1);
       AD = IntegratedSimilarity(KD, SD,dss);
       AM = IntegratedSimilarity(KM, SM,mfs); 
        
        F=Job(AD,AM,PY,gamma,beta);
        finalscore=F(A(cv,1),A(cv,2));
        % make the score of seed  disease-microbe Ys as zero
        for i=1:nd
            for j=1:nm
                if Y(i,j)==1
                   F(i,j)=0;
                end
            end
        end
        % obtain the position of tested disease-microbe Y as variable globalposition(1,cv),
        [ll1,~]=size(find(F>=finalscore));
        if(ll1==0) 
            ll1=1;
        end
        [ll2,~]=size(find(F>finalscore));
        globalposition(1,cv)=(ll2+1+(ll1-ll2-1))/2;
        str0 = sprintf('Experiment type        : Global cross validation');
        disp(str0);
        str1 = sprintf('Total steps are        : %d',pp);
        disp(str1);
        str2 = sprintf('Current step is        : %d',cv);
        disp(str2);
        str3 = sprintf('Precicting score is    : %d',finalscore);
        disp(str3);
        str = sprintf('The current ranking is : %d',globalposition(1,cv));
        disp(str);
        str4 = sprintf('\n');
        disp(str4);
    end
    
    save('globalposition.mat','globalposition')
end
  