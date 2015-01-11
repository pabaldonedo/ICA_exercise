function preprocessed = preprocessing(X)

    %remove mean
    preprocessed = bsxfun(@minus, X, mean(X,2));
end