function label = clasify(filename, M)
    samples = size(M, 1);
    errors = zeros(1, size(M,3));
    data = process(filename, samples);
    for class = 1:size(M,3)
        errors(class) = norm(M(:, 1:3, class)-data);
    end
    [~, label] = min(errors);
end