function weight_vector = layer_processing( X,f,sigma_noise_square )

%set a prior distribution for weight : 0 mean distribution.
dim = size(X);
num_rows = dim(1);
num_cols = dim(2);
sigma_p = randn(num_rows);
sigma_p = sigma_p*sigma_p'; %to have a positive semi definite matrix

%weights distribution
A = (1/sigma_noise_square)*(X*X')+inv(sigma_p);
w_mean = (1/sigma_noise_square)*inv(A)*X*f;
w_var = inv(A);
w = mvnrnd(w_mean,w_var);
weight_vector = w';
end

