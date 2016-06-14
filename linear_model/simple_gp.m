
clear all;close all;
A = importdata('Concrete_Data.xls');

dataset = A.data.Sheet1;
X_all = dataset(:,1:8);
X_all = X_all';
f_all = dataset(:,9);
sigma_noise_square = 0.03;
X_all = projection(X_all,4);
d=size(X_all);
[ X_all,f_all,n,X_test,f_test,n_ ] = split_data( X_all,f_all );
 weight_vector = layer_processing( X_all,f_all,sigma_noise_square );
[ prediction, err ] = validation( X_test,n_,f_test,[],weight_vector,4,sigma_noise_square);
fprintf('test error : %f\n',err);
scatter(f_test,prediction','filed');
axis([0 80 0 80])
title('scatter bayesian regression')
