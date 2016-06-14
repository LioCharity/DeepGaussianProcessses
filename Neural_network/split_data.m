function [ X,f,n,X_,f_,n_ ] = split_data( X_all,f_all )
% d=size(X_all);
% n = floor(d(2)*7/10);
% n_ = d(2) - n;
% %training data
% X = X_all(:,1:n);
% f = f_all(1:n);
% %test data
% X_ = X_all(:,n+1:d(2));
% f_ = f_all(n+1:d(2));

d=size(X_all);
n = floor(d(2)*7/10);
n_ = d(2) - n;
R = randperm(length(X_all));
indices_X = R(1:n);
indices_X_ = R(n+1:length(R));
X = X_all(:,indices_X);
X_= X_all(:,indices_X_);
f = f_all(indices_X);
f_ = f_all(indices_X_);

end

