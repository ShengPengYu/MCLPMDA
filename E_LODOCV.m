%leave one disease out cross-validation(LODOCV)
clc;              
clear;            % clear all workspace variables
close all;        % close all windows
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
load dss ;
load mfs ;
load SD;
load SM;
 
load knownre ;
Y = knownre ;         % Y is the ground truth matrix (383*495)
load HMDD;
[dn,mn] = size(Y);

gama=0.99;
beta = 0.51;

dNames = importdata('./DATASET/dssname.txt');
mNames = importdata('./DATASET/mfsname.txt');

for dIndex =1:1:dn
    temp_Y = Y ;
    row = temp_Y(dIndex,:);
    temp_Y(dIndex,:)=0;
   
    [KD,KM] = GaussianKernel(temp_Y,1,1);
    AD = IntegratedSimilarity(KD, SD,dss);
    AM = IntegratedSimilarity(KM, SM,mfs);
    
    
    [temp_F] = Job(AD,AM,temp_Y,gama,beta); % the predict result save in F matrix
    
    filename = strcat('./Experiments/lodocv/',num2str(dIndex),'.txt');
    fp = fopen(filename,'w');
    fprintf(fp,'%s\t%s\t%s\t%s\n','miRNA','disease','label','score');
    for mIndex = 1:1:mn
        fprintf(fp,'%s\t%s\t%d\t%e\n',mNames{mIndex,1},dNames{dIndex,1},row(1,mIndex),temp_F(dIndex,mIndex));
    end
    
    str0 = sprintf('Experiment type               : leave one disease out cross-validation(LODOCV)');
    disp(str0);
    str1 = sprintf('The file.s storage path is    : %s',filename);
    disp(str1);
    str3 = sprintf('Current is                    : %d',dIndex);
    disp(str3);
    str = sprintf('Total steps are               : %d', dn);
    disp(str);
    str4 = sprintf('\n');
    disp(str4);
    
    fclose(fp);
end
