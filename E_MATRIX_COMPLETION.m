%matrix completion algorithm
clc;              
clear;             % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder)); 

load dss ;
load mfs ;


load knownre ;
Y = knownre ;         % Y is the ground truth matrix (383*495)

[D1, ~, ~] = inexact_alm_mc(dss);
[M1, ~, ~] = inexact_alm_mc(mfs);

SD1 = abs(D1.U*D1.V');
SM1 = abs(M1.U*M1.V');                                                    

 
 
[D2, ~, ~] = inexact_alm_mc(Y, 1e-4,13);
[M2, ~, ~] = inexact_alm_mc(Y', 1e-4,6);

SD2 = abs(D2.U*D2.U');
SM2 = abs(M2.U*M2.U');                                                    



[GD,GM] = GaussianKernel(Y,1,1);

SD = (SD1+SD2+GD);
SM = (SM1+SM2+GM);


save('./DATASET/SD.mat','SD');
save('./DATASET/SM.mat','SM');