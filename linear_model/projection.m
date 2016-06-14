function projected = projection( X, number)
dim = size(X);
num_rows = dim(1);
num_cols = dim(2);
scaled = phi(X(:,1),number);
for i=2:num_cols
    scaled = [scaled,phi(X(:,i),number)];
end
projected = scaled;
end

