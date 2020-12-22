function animate(X)
%animate: function showing change in ratio of susceptible, infected and
%recovered individuals in grid as image
%   Inputs:
%       X: MxNx3xlength(time) matrix, each point in MxN space corresponds
%       to single grid with 3 numbers between 0 and 1 showing the SIR
%       result. Repeading for each time step to make 4D matrix
%   Output:
%       None

h = 0.1; %Time step
t0 = 0; %stores initial time
tFinal = 60; %Final time
tSteps = (tFinal-t0)/h+1; %obtains total number of steps needed
X = circshift(X,2,3); %Shift so blue indicates susceptible
figure(); %Make new figure
pause(0.2); %Allows image to load better

for t = 1:tSteps
    if mod(t-1,10) == 0
        currentImage = X(:,:,:,t); %obtain 3D data at that time
        image(currentImage); %create the image
        pause(0.1); %Pause to display at every 10th time step
    end

end


end