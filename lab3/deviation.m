%returns standard deviation of the set given the index of mean 
function V = deviation(x, mean)

var = 0;
for i=1:size(x,1)
    var = var + x(i)*(i-mean)^2;
end
V = sqrt(var/sum(x));