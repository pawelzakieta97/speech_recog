%MACIERZ CECH:
%   M(t, cecha, klasa):
%   cecha -     1 -moc,
%               2 -srednia czestotliwosc,
%               3- odchylenie std czestotliwosci,
%               4 -odchylenie std mocy wewnatrz zbioru uczacego,
%               5 -odchylenie std sredniej czestotliwosci,
%               6 -odchylenie std odchylenia std
%   klasa - 1, 2, 3

names = ["training/raz1.wav","training/raz2.wav","training/raz3.wav";...
    "training/dwa1.wav","training/dwa2.wav","training/dwa3.wav";...
    "training/trzy1.wav","training/trzy2.wav","training/trzy3.wav"];
samples = 10;   %number of samples in time considered
M = zeros(samples, 6, size(names,1));


for class = 1:size(names,1)
    for t_sample=1:size(names,2)
        name = char(names(class, t_sample));
        [y, Fs] = audioread(name);
        freq = abs(spectrogram(y, length(y)/64, 0, [],'yaxis'));
        freq = crop(freq);
        freq = imresize(freq, [size(freq, 1), samples]);
        for t=1:samples
            M(t, 1, class) = M(t, 1, class) + sum(freq(:,t));
            M(t, 2, class) = M(t, 2, class) + myMean(freq(:,t));
            M(t, 3, class) = M(t, 3, class) + deviation(freq(:,t), M(t, 2, class));
        end
    end
    %   each sample is:
    %       -cropped to interesting region
    %       -rescaled to a constant number of samples
    %       -normalized so the mean is 0 and std div is 1
    
    M(:, 1, class) = normalize(M(:, 1, class));
    M(:, 2, class) = normalize(M(:, 2, class));
    M(:, 3, class) = normalize(M(:, 3, class));
    
    
end
figure;
plot(M(:, 1, 1));