%Prediction work
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
load x ;
X = x ;

[KD,KM] = GaussianKernel(Y,1,1);
AD = IntegratedSimilarity(KD, SD,dss);
AM = IntegratedSimilarity(KM, SM,mfs);

dNames = importdata('./DATASET/dssname.txt');
mNames = importdata('./DATASET/mfsname.txt');

gama=0.95;
beta = 0.6;
[F] = Job(AD,AM,Y,gama,beta); % the predict result save in F matrix

[R,I] = sort(F,2,'descend');


 [nd,nm] = size(F);
 
  filename = './Experiments/predict/predict_result.txt';
 fp = fopen(filename,'w');

 
for dIndex = 1:1:nd
    fprintf(fp,'%s\t',dNames{dIndex,1});   
    for mIndex = 1:1:nm
        fprintf(fp,'%s\t',mNames{I(dIndex,mIndex),1});   
    end
    fprintf(fp,'\n');
end
fclose(fp);


