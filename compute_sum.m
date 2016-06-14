function result = compute_sum( v1,v2,s,m )
%compute the sum of cos(2*pi*s'*(v1-v2))
result = 0;
for r=1:m
    s_r = s(r,:);%take the raw r
   result = result + cos(2*pi*s_r*(v1-v2)); 
end
end

