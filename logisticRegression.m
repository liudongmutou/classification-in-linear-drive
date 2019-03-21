function [theta h]=logisticRegression(x,y)
[m, n] = size(x);
x = [ones(m, 1), x]; 

theta = zeros(n+1, 1);
% Newton's method
interation =50000;
J = zeros(interation, 1);

for i = 1:interation
    % Calculate the hypothesis function
    z = x * theta;%Hypothesis function
    h = sigmoid(z);%logistic function
    grad = (1/m).*x' * (h-y);
    % Calculate gradient
    % Calculate J 
    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h));
    theta = theta - 1*grad;%theta=theta-alpha*grad
end
h=sigmoid(x*theta);