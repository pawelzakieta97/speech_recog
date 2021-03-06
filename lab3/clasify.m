function label = clasify(filename, M)
    samples = size(M, 1);
    errors = zeros(1, size(M,3));
    data = process(filename, samples);
    for class = 1:size(M,3)
        for feature = 1:size(M, 2)/2
            for t=1:samples
                errors(class) = errors(class) + ((M(t, feature, class)-data(t, feature)))^2;
            end
        end
        %errors(class) = errors(class)/
        %errors(class) = norm(M(:, 1:3, class)-data);
    end
    %errors
    [~, label] = min(errors);
end