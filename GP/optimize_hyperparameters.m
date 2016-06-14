function p = optimize_hyperparameters( params,input,t,iter )
%params is a column vector of size D
%input is a nX(D+2) matrix of inputs data
%t is a raw vector of size n
%iter is the number of iteration for the gradient descent

%the goal is to optimize the D first elements od the params vector
p = params;
[n, D] = size(input);  %dimensions of the input data.
lambda = 0.01;
for i=1:iter
   [fX, dfX] = gp01lik(params, input, t);
   dfX = dfX/max(dfX)
   %update parameters
   for d=1:D
      p(d) = p(d) + lambda * dfX(d); 
   end
end
end