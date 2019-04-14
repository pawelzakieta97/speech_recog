[y, Fs] = audioread('training/raz1.wav');


frequency_raw = abs(spectrogram(y, length(y)/64, 0, [],'yaxis'));
%frequency_raw = crop(frequency_raw);
figure;
spectrogram(y, length(y)/64, 0, [],'yaxis');
frequency_cropped = crop(frequency_raw);
shape = size(frequency_cropped);
frequency_cropped = imresize(frequency_cropped, [shape(1),10]);
data_reduced = zeros(10,3);



for t = 1:10
    
    data_reduced(t,1) = sum(frequency_cropped(:,t));
    data_reduced(t,2) = myMean(frequency_cropped(:,t));
    data_reduced(t,3) = deviation(frequency_cropped(:,t),data_reduced(t,2));
    
end
data_reduced(:,1) = normalize(data_reduced(:,1));
data_reduced(:,2) = normalize(data_reduced(:,2));
data_reduced(:,3) = normalize(data_reduced(:,3));
figure;
plot(data_reduced(:,1))
figure;
plot(data_reduced(:,2))
figure;
plot(data_reduced(:,3))