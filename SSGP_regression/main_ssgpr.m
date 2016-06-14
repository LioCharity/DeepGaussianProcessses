
clear all;close all;
A = importdata('Concrete_Data.xls');
dataset = A.data.Sheet1;
X_all = dataset(:,1:8); %nXD
f_all = dataset(:,9); %nX1
[ X_tr,f_tr,n_tr,X_test,f_test,n_test ] = split_data( X_all',f_all ); %results : numberXD
[NMSE, mu, S2, NMLP, loghyper, convergence] = ssgpr_ui(X_tr', f_tr, X_test', f_test, 100,1000);

prediction = normrnd(mu,S2);
err = mean((prediction - f_test).^2)
scatter(f_test,prediction,'filed');
title('scatter plot sparse spectrum GP');