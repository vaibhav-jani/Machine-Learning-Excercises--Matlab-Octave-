function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

n = size(theta);

grad = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1:m
    
    H = sigmoid(X(i, :) * theta);
    
    J =  J + (( -y(i) * log (H)) - ((1 - y(i)) * log(1 - H)));
    
    diff = H - y(i);
    
    for j = 1:n
        
        grad(j) = grad(j) + (diff * X(i, j));
        
    end;
    
end

J = J/m;

R = 0;

for j = 1:n
    
    if(j == 1)     
        continue;
    end;    
    
    R = R + (theta(j) .^ 2);
    
end;

R = (R * lambda) / (2*m);

J = J + R;

for j = 1:n
    
    if(j == 1)
        
        grad(j) = (grad(j)/m);
        continue;
    end;    
    
    grad(j) = (grad(j)/m) + ((lambda * theta(j))/m);
    
end;

% =============================================================

end
