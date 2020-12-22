function dxdt = dynamicsSIR(x,M,N,alpha,beta,gamma)
%dynamicsSIR: Computes rate of change of model
%   Inputs:
%       x: Vectorized state
%       M, N: size of grid
%       alpha, beta, gamma: model parameters
%   Output:
%       dxdt: vectorized time derivative of state

%% Initialization
dxdt = zeros(M,N,3); %Initialize matrix for derivative of state
x = reshape(x,M,N,3); %Change x back into a grid form

%% Calculating the derivative
for col = 1: N %Loop through the columns
    for row = 1: M %Loop through the rows
        weights = 0; %stores the weight term
        if col + 1 <= N
            weights = weights + 1*x(row,col+1,2); %add weight from square directly on right
        end
        if col - 1 >= 1
            weights = weights + 1*x(row,col-1,2); %add weight from square directly on left
        end
        if row + 1 <= M
            weights = weights + 1*x(row+1,col,2); %add weight from square directly on top
            if col + 1 <= N
                weights = weights + 1/sqrt(2)*x(row+1,col+1,2); %add weight from top right
            end
            if col - 1 >= 1
                weights = weights + 1/sqrt(2)*x(row+1,col-1,2); %add weight from bottom right
            end
        end
        if row - 1 >= 1
            weights = weights + 1*x(row-1,col,2); %add weight from square directly on bottom
            if col + 1 <= N
                weights = weights + 1/sqrt(2)*x(row-1,col+1,2); %add weight from top left
            end
            if col -1 >= 1
                weights = weights + 1/sqrt(2)*x(row-1,col-1,2); %add weight from bottom left
            end
        end    
        weights = alpha*weights; %Multiply by alpha, last step
        dxdt(row,col,1) = -(beta*x(row, col, 2)+weights)*x(row,col,1); %Derivative of susceptible
        dxdt(row, col, 2) = (beta*x(row, col, 2) + weights)*x(row,col,1)-gamma*x(row,col,2); %Derivative of infected
        dxdt(row, col, 3) = gamma*x(row, col, 2); %Derivative of recovered
    end
end

%% Vectorize derivative
dxdt = dxdt(:);
end
        



