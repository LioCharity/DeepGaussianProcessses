
clear all;close all;
A = importdata('Concrete_Data.xls');
dataset = A.data.Sheet1;
X_all = dataset(:,1:8); %nXD
f_all = dataset(:,9); %nX1
d = size(X_all);
for i=1:d(2)
   X_all(:,i)= (X_all(:,i)-mean(X_all(:,i)))/std(X_all(:,i));
end
[ X_tr,f_tr,n_tr,X_test,f_test,n_test ] = split_data( X_all',f_all ); %results : numberXD
d=size(X_tr);
params = [0.8150;0.1876;0.5056;0.4096;0.4910;0.4206;0.0486;0.6719;0.4545;0.2194]; %best value
%params = [rand(d(1),1);0.4545;0.2194];
[mu, S2, deriv, S2deriv, dummy] = gp01pred(params, X_tr', f_tr, X_test');

prediction = normrnd(mu,S2);
prediction = prediction + mean(f_tr);
err = mean((prediction - f_test).^2)
figure(1)
scatter(f_test,prediction,'filed');
title('scatter plot Gaussian Process');
axis([0 90 0 90]);