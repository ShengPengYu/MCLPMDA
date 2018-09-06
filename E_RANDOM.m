%
clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;     
addpath(genpath(currentFolder));   
load x;

x = randperm(5430)';
save('./DATASET/x.mat','x')