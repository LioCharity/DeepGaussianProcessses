function [ prediction, err ] = validate( X_,n_,f_,w,number,sigma_noise_square )
e = 0;
d=size(X_);
for i=1:n_
    if d(1) == 1
        X_2 = phi(X_(:,i),number);
    else
        X_2 = X_(:,i);
    end
    prediction(i) =  X_2'*w + normrnd(0,sigma_noise_square);
    e = e + (prediction(i) - f_(i))^2;
end
err = e/n_;
end

