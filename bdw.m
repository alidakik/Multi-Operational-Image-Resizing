function bdw_distance = bdw(S, T)


    S = rgb2gray(S);
    T = rgb2gray(T);

    NS = size(S,2); 
    NT = size(T,2); 
    h = size(S,1);

    sum_a_dtw_s_t = 0;
    sum_a_dtw_t_s = 0;
    
    for i = 1:h
        sum_a_dtw_s_t = sum_a_dtw_s_t + a_dtw(S(i,:), T(i,:));
    end

    
    for i = 1:h
        sum_a_dtw_t_s = sum_a_dtw_t_s + a_dtw(T(i,:), S(i,:));
    end

     bdw_distance = (1/NS * sum_a_dtw_s_t) + (1/NT * sum_a_dtw_t_s);


    % We tryed t vectorized but didn't worked

    % sum_a_dtw_s_t = sum(arrayfun(@(i) a_dtw(S(i,:), T(i,:)), 1:h));
    % sum_a_dtw_t_s = sum(arrayfun(@(i) a_dtw(T(i,:), S(i,:)), 1:h));


   

end