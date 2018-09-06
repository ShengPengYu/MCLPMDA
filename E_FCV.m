%five fold cross validation
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
load SD ;
load SM ;
load knownre ;
Y = knownre ;         % Y is the ground truth matrix (383*495)
load HMDD;
load x ;
X = x ;

gama=0.99;
beta = 0.51;

fcv_position = Get_fcv_position(dss,mfs,SD,SM,Y,HMDD,X,gama,beta);
F_AUC = Fpositiontooverallauc(Y,HMDD,fcv_position);