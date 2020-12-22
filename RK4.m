function [t,y] = RK4(f, tspan, y0)
%RK4 numerically solves a differential equation using 4th order Runge-Kutta
%algorithm
%   Inputs:
%       f: function handle for f(t,y)
%       tspan: time period for simulation in form [startTime, endTime]
%       y0: initial conditions
%   Outputs:
%       t: time sequence as T x 1 vector
%       y: solution of differential equation in T x n matrix, T is number
%       of time steps, n is dimension of y

%% Initialization
h = 0.1; %time step
nSteps = (tspan(2)-tspan(1))/h + 1; %number of steps
t = zeros(nSteps, 1); %creates time array
y = zeros(nSteps, length(y0)); %Initialize solutions array

%% Initial values
t(1) = tspan(1); %initial time
y(1,:) = y0; %Initial conditions for solution
k = 1; %loop variable

%% Finding next values in solution using Runge-Kutta
while k < nSteps
    currC = y(k,:); %obtain the current conditions
    currC = currC'; %Change current conditions into column vector
    
    % Values for k1,k2,k3,k4
    k1 = h*f(t(k),currC);
    k2 = h*f(t(k)+h/2,currC+k1/2);
    k3 = h*f(t(k)+h/2,currC+k2/2);
    k4 = h*f(t(k)+h, currC+k3);
    
    t(k+1) = t(k)+h; %update time array
    y(k+1,:) = currC+(k1+2*k2+2*k3+k4)/6; %Update solutions matrix
    k = k+1; %Increment k to next value
end

end








