%global cross validation
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
 
gama=0.99;
beta = 0.51;

global_position = Get_global_position(dss,mfs,SD,SM,Y,HMDD,gama,beta);
G_AUC = Gpositiontooverallauc(Y,HMDD,global_position);
