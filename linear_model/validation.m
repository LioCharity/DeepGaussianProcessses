function [prediction,err] = validation( X_,n_,f_,w1,W,number,sigma_noise_square)

a = size(w1);
if a(1) ~= 0
    for i=1:n_
        prediction(i) = X_(:,i)'*w1;
    end
    for j=1:n_
        tmp = phi(prediction(j),number);
        mat(:,j) = tmp;
    end
    X_ = mat;
end
prediction=[];
dim = size(W);
number_of_weight = dim(2);
d = size(X_);
%for all the weight
for k=1:number_of_weight
    prediction=[];
    for i=1:n_
        if d(1) == 1
            X_1 = phi(X_(:,i),number);
        else
            X_1 = X_(:,i);
        end
        w = W(:,k);
        prediction(i) = X_1'*w;
    end
    for j=1:n_
       tmp = phi(prediction(j),number);
       mat(:,j) = tmp;
    end
    X_ = mat;
end
for i=1:n_
   prediction(i) = prediction(i)+normrnd(0,sigma_noise_square); 
end
err = sum((prediction'-f_).^2)/n_;
end

