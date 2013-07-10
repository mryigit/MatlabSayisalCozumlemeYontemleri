function f = Bi_ler(x, fx)
    len_x = length(x);
    fx = fx';
    x  = x';
    f = zeros(2 * (len_x - 1) - 1, 1);
    for i = 1 : len_x - 1
        f(i, 1) = fx(i + 1) - fx(i);
    end
    
end