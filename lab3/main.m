% names = ["training/raz1.wav","training/raz2.wav","training/raz3.wav";...
%     "training/raz_1.wav","training/raz_2.wav","training/raz3.wav";...
%     "training/dwa1.wav","training/dwa2.wav","training/dwa3.wav";...
%     "training/trzy1.wav","training/trzy2.wav","training/trzy3.wav"];


files = dir('training');
names = [convertCharsToStrings(files(3).name)];
for file = 3:length(files)
    nam = "training/" + convertCharsToStrings(files(file).name);
    names(file-2) = nam;
end
names = reshape(names,[],3)';
tmp = names(1,:);
names(1,:) = names(2,:);
names(2,:) = tmp;

correct = zeros(size(names));
for out = 1:size(names, 2)
    L1O = names(:,[1:out-1, out+1:end]);
    M = generateM(L1O);
    for l_idx=1:size(names,1)
        nam = names(l_idx, out);
        correct(l_idx, out) = clasify(char(nam), M)==l_idx;
    end
end

