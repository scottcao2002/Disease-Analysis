function plotTimeSeries(t,X,x,y)
%plotTimeSeries: function plotting and saving SIR distribution for the
%coordinate (x,y)
%   Inputs:
%       t: vector of time steps
%       X: MxNx3xtime matrix, each point in MxN space corresponding to SIR
%       model with states of values between 0and 1. 3D matrix repeated for
%       each time step to make 4D matrix
%       x: x-coordinate on grid
%       y: y-coordinate on grid
%   Outputs:
%       None

%% Getting the SIR numbers
S = X(x,y,1,:); %obtaining the susceptible array
I = X(x,y,2,:); %obtaining the infected array
R = X(x,y,3,:); %obtaining the recovered array
%% Delete all dimensions of 1
S = squeeze(S);%Susceptible array
I = squeeze(I);%Infected array
R = squeeze(R);%Recovered array

figure(); %make new figure

label = sprintf('Plot of SIR ratios for cell (%d, %d)', x, y); %create string for title of plot
title(label); %title the plot

%% Plotting susceptible
subplot(3, 1, 1); %create top subplot
plot(t,S);%plot susceptible vs. time
ylabel('Ratio of susceptible');
xlim([0,60]); %limit x-axis range to make it look better
ylim([0,1]); %limit y-axis range for consistency

label = sprintf('Plot of SIR ratios for cell (%d, %d)', x, y); %create string for title of plot
title(label); %title the plot

%% Plotting Infected
subplot(3,1,2); %create middle subplot
plot(t,I); %Plot infected vs. time
ylabel('Ratio of infected');
xlim([0,60]); %limit x-axis range to make it look better
ylim([0,1]); %limit y-axis range for consistency

%% Plotting recovered
subplot(3,1,3); %create bottom subplot
plot(t,R); %Plot recovered vs. time
xlim([0,60]); %limit x-axis range to make it look better
ylim([0,1]); %limit y-axis range for consistency
ylabel('Ratio of recovered');
xlabel('Time (t)');






end
