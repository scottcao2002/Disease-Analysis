%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: MainScriptPCA.m
% Description: This script will plot principal components for COVID-19 data
% across various countries
%   Inputs: This script takes the inputs of infections, deaths, cures,
%   mortality, cure rate, and infection rate for various countries
%   Outputs: The script outputs the plot with the principal components
%   along the axes for all the countries
%   Methods: It uses PCA in order to identify the principal components to
%   plot the data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

%% Get file for data
covidFile = importdata('covid_countries.csv'); %stores csv file

%% Obtain data
covidData = covidFile.data; %stores COVID data

%% Do PCA to data
[eigenV, dataPCA] = myPCA(covidData); %runs PCA on data

%% Plot
variables = {'Infections', 'Deaths', 'Cures', 'Mortality Rate (%)', 'Cure Rate (%)', 'Infection Rate (%)'}; %stores names of variables
biplot(eigenV(:,1:2), 'scores', dataPCA(:,1:2), 'VarLabels',variables); %plot data keeping 2 principal components
box on;




