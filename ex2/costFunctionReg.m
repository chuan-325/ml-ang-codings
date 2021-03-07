function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

y_imp = 1 - y;
hX = sigmoid(X * theta); % m*(n+1), (n+1)*1
J = ((0 - (y' * log(hX)) - (y_imp' * log(1 - hX))) + (theta(2:size(theta))' * theta(2:size(theta)) * lambda / 2)) / m;
theta_now = theta;
theta_now(1) = 0;
grad = ((X' * (hX - y)) + lambda * theta_now) / m

% =============================================================

end
