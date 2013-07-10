function f = si_ler(x, fx)
    len_x = length(x);
    fx = fx';
    x  = x';
    f = zeros(len_x - 2, 2 * (len_x - 1) - 1);
    
    f(1, 1) = 1;
    f(1, 2) = -1;
    j = 2;
    
    for i = 2: len_x - 2
        f(i, j) = 1;
        j = j + 1;
        f(i, j) = 2 * (x(i + 1) - x(i));
        j = j + 1;
        f(i, j) = 1;
    end
    
end