function result = phi( x,N )
% receive a D dimensional array and return a D*N dimensional array
% x is a column array
result = x.^0;
for i=1:N
   result = [result;x.^i]; 
end
end

