%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: MainScriptDiseaseSimulation.m
% Description: This script will solve a spatial SIR system by using a
% differential equation solver, plotting on area's change over time, and
% animating the total area's change over time
%   Inputs: This script takes the initial values of SIR for the area, along
%   with the alpha, beta, and gamma values for the SIR equations and the
%   maximum time
%   Outputs: The script outputs the time it takes for the differential
%   equation solvers to solve the model, and it plots the change over time
%   for a few specific regions then animates the entire region
%   Methods: It uses the 4th order Runge-Kutta method to solve the spatial
%   SIR equations, and it will uses functions to plot the SIR in one
%   location and another to animate how the disease spreads over time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

%% Initial variables
load('initialValues.mat'); %loading the initial data
alpha = 0.1; %value for spatial contact rate
beta = 0.05; %value for contact rate
gamma = 0.1; %value for recovery rate
tFinal = 60; %Final time

%% Solving the spatial SIR 
fprintf('Created differential equation solver:\n');
tic
[time,sol]=solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @RK4); %solves SIR equation
toc
fprintf('Built-in differential equation solver time:\n');
tic
[time2,sol2] = solveSpatialSIR(tFinal,initialConditions,alpha,beta,gamma,@ode45); %solves using built-in function
toc

%% Plotting at specific grid points
x = [1,5,30]; %x-values for coordinates
y = [1,18,70]; %y-values for coordinates
for n = 1:length(x)
    plotTimeSeries(time,sol,x(n), y(n)); %plots SIR
end


%% 2D animation
animate(sol); %Animates the SIR at all gridpoints



