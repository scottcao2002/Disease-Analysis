function [t,x] = solveSpatialSIR(tFinal, initialCondition, alpha, beta, gamma, odeSolver)
%solveSpatialSIR: solves the spatial SIR model
%   Inputs:
%       tFinal: end time for simulation (assume tstart = 0)
%       initialCondition: MxNx3 matrix, sums to 1 in 3rd dimension
%       alpha, beta, gamma: model parameters
%       odeSolver: function handle for 4th order Runge-Kutta solver
%   Outputs:
%       t: vector of time-steps
%       x: MxNx3xlength(t) matrix representing state vs. time
sizeGrid = size(initialCondition); %obtains size of grid
initialCondition = initialCondition(:); %vectorize initial conditions
f = @(t,x)dynamicsSIR(x, sizeGrid(1), sizeGrid(2), alpha, beta, gamma); %turns odeSolver into function handle
[t,xRaw] = odeSolver(f, [0,tFinal], initialCondition); %Run the ODE solver

%% Reorder the solutions matrix
x = zeros(sizeGrid(1),sizeGrid(2),3,length(t)); %initialize solutions
for time = 1:length(t)
    x(:,:,:,time) = reshape(xRaw(time,:),[sizeGrid(1),sizeGrid(2),3]); %change to MxNx3xlength(t) matrix
end

end
