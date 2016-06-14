clear all;close all;
A = importdata('Concrete_Data.xls');
dataset = A.data.Sheet1;
X_all = dataset(:,1:8); %nXD
f_all = dataset(:,9); %nX1
d = size(X_all);
for i=1:d(2)
   X_all(:,i)= (X_all(:,i)-mean(X_all(:,i)))/std(X_all(:,i));
end
[ X_tr,f_tr,n_tr,X_test,f_test,n_test ] = split_data( X_all',f_all ); %results : DXnumber

net = newgrnn(X_tr,f_tr');
prediction = sim(net,X_test);
err = mean((prediction' - f_test).^2)

figure(1)
scatter(f_test,prediction,'filed');
title('scatter plot Gaussian Process');
axis([0 90 0 90]);