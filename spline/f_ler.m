function f = f_ler(x, fx)
    len_x = length(x);
    fx = fx';
    x  = x';
    f = zeros(len_x - 1, 2 * (len_x - 1) - 1);
    f(1, 1) = x(2) - x(1);
    j = 2;
    for i = 2 : len_x - 1
        f(i, j) = x(i + 1) - x(i);
        j = j + 1;
        f(i, j) = (x(i + 1) - x(i)) ^ 2;
        j = j + 1;
    end
    
end