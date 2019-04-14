function data = crop(data0)

power = mean(sum(data0));
mask = sum(data0)>power;
len = sum(mask);
padding = int32(len/10);

indecis = find(mask);
start = max(indecis(1)-padding,1);
finish = min(indecis(length(indecis))+padding,size(data0,2));
data = data0(:, start:finish);