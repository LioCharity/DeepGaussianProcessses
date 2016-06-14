function cov_mat = cov_mat( X1,X2,sigma_f,l )
%compute the covariance matrix
n1 = length(X1);
n2 = length(X2);
for i=1:n1
    for j=1:n2
        cov_mat(i,j)=sigma_f *exp((-1/(2*l^2))*(abs(X1(i)-X2(j))^2));
    end
end

end

