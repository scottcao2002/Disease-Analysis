function [coeffOrth, pcaData] = myPCA(data)
% myPCA analyzes principal components of given COVID-19 statistical data
% from multiple countries - covid_countries.csv
%   Inputs:
%       data: nxp matrix representing numerical parts of dataset
%   Outputs:
%       coeffOrth: pxp matrix with eigenvectors as columns corresponding to
%       sorted eigenvalues
%       pcaData: nxp matrix representing data projected on principal
%       components

%% Initialization
sizeData = size(data); %stores the dimensions of the data
normalData = zeros(sizeData); %normalized data array, has same nxp dimensions as data


%% Normalization
for j = 1:sizeData(2) %loops through each column in data
    normalData(:,j) = (data(:,j)-mean(data(:,j)))/std(data(:,j)); %normalizes column j
end

%% Covariance
covar = cov(normalData); %creates the covariance matrix

%% Eigenvalues/Eigenvectors
[eigVec, eigVal] = eig(covar); %stores eigenvalues and eigenvectors of covariance matrix

%% Getting Principal Components
eigVal = abs(diag(eigVal)); %stores eigenvalues in column vector and take absolute value
eigVec = eigVec'; %transposes eigenvector matrix so eigenvectors are row vectors
allEig = [eigVal,eigVec]; %creates matrix with eigenvalues as 1st column and corresponding eigenvectors in same row
allEig = sortrows(allEig, 'descend'); %sorts matrix based on eigenvalues from most to least
coeffOrth = allEig(:,[2:end]); %matrix with eigenvectors in each row
coeffOrth = coeffOrth'; %makes eigenvectors in each column

%% Projects data on principal components
pcaData = normalData*coeffOrth; %adjust data along new bases
end
