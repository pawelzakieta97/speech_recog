%normalizes dataset- sets mean to 0 and std deviation to 1
function normalized = normalize(data)

[mean, dev] = normfit(data)
normalized = (data-mean)/dev;