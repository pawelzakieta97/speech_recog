%returns average index number weighed by value at that index
function m = myMean(x)
s = 0;
w = 0;
for i=1:size(x,1)
    w = w+x(i);
    s = s+i*x(i);
end
m = s/w;