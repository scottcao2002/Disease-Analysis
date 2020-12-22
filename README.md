# Disease-Analysis
This is a project for analyzing disease. One part of the project will be data analysis on the disease COVID-19 and how it affects different countries, and the other part will be simulating how a disease spreads throughout a population by solving the spatial SIR model. All the files for this project should be downloaded in the same folder in order for the program to be run correctly.

# Part 1: PCA
Part 1 of the project deals with doing principal component analysis (PCA) on a dataset regarding COVID-19. Because there are so many factors related to COVID-19, from cure rate to infection rate to deaths, there needs to be a way to reduce these factors down to the 2 most important ones. PCA does this. The main script for part 1 is named MainScriptPCA.m, and it should be run in order to see the resulting PCA plot of COVID-19 for various countries. The data for these countries can be obtained from the file covid_countries.csv. 

The following files need to be downloaded in order for the main script to be run correctly:

MainScriptPCA.m

covid_countries.csv

myPCA.m

# Part 2: Spatial SIR Model
Part 2 of the project deals with modelling how a disease spreads through a population. This is done by solving the spatial SIR model using the 4th order Runge-Kutta method. The model will be simulated on a 50x75 grid. The initial data for this grid is found in initialValues.mat. The main script for this part is named MainScriptDiseaseSimulation.m. When this script is run, a few figures are outputted. The first 3 figures show graphs of the SIR values for grid coordinates at (1, 1), (5, 18), and (30, 70). Also, it will output a simulation for how the disease spreads through the population. The link to this simulation is here: https://www.youtube.com/watch?v=2DD_D0hONIo

The following files need to be downloaded in order for the main script to be run correctly:

animate.m

RK4.m

plotTimeSeries.m

solveSpatialSIR.m

dynamicsSIR.m

mainScriptDiseaseSimulation.m

initialValues.mat

# Full Documentation
The full documentation of this project can be found here: https://drive.google.com/file/d/1FV2fUi_POPZ184YEnOlOni5s4XPYEief/view?usp=sharing 
