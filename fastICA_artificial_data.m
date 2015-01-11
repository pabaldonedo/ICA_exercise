function fastICA_artificial_data(sources, coeficients)

    mixtures = zeros(size(sources));

    figure()
    
    for i = 1:size(mixtures, 1)
        for j = 1:size(mixtures,1)
            mixtures(i,:) = mixtures(i,:) + coeficients(i,j)*sources(j,:);
        end
        subplot(size(mixtures,1), 1, i)
        hold on
        plot(mixtures(i,:))
        box off
        grid on
    end

    
    

    %fastICA
    [icasig, ~, ~] = fastica(mixtures, 'approach', 'symm');

    figure()
    for i = 1:size(mixtures,1)
        subplot(size(mixtures,1),1,i)
        hold on
        plot(sources(i,:))
        plot(icasig(i,:), 'k')
        box off
        grid on
    end

end