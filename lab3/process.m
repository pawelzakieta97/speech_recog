%function that process and normalizes given file and outputs proper features
function data = process(filename, samples)
[y, ~] = audioread(filename);


freq = abs(spectrogram(y, length(y)/64, 0, [],'yaxis'));
freq = crop(freq);
freq = imresize(freq, [size(freq,1),samples]);
data = zeros(samples,3);
for t = 1:samples
    
    data(t,1) = sum(freq(:,t));
    data(t,2) = myMean(freq(:,t));
    data(t,3) = deviation(freq(:,t),data(t,2));
    
end
data(:,1) = normalize(data(:,1));
data(:,2) = normalize(data(:,2));
data(:,3) = normalize(data(:,3));