function dtw_distance = a_dtw(s, t)

    M = inf(length(s)+1, length(t)+1);    

    M(1, 1) = 0;

    for j=1:length(t)+1
        M(1,j) = 0;
    end
    
    
    
    for i = 2:length(s)+1
        for j = 2:length(t)+1
            cost = abs(s(i-1) - t(j-1)); 
            M(i, j) = cost + min([M(i-1, j-1), M(i, j-1), M(i-1, j)]);
        end
    end

    dtw_distance = M(length(s)+1, length(t)+1);
end