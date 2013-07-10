function V = ikinci_dereceden_spline(veri2)
    
    don = {};
    x  = veri2(:, 1);
    fx = veri2(:, 2);
    
    len_x = length(x);
    
    C = zeros(3 * (len_x - 1), 1);
    
    bul = zeros(2 * (len_x - 1) - 1, 1);
    
    a1 = f_ler(x, fx);
    a2 = si_ler(x, fx);
    
    
    A = [a1; a2];
    B = Bi_ler(x, fx);
    bul = inv(A) * B;
    don{1} = '                           A Matrisi ';
    don{2} = num2str(A, '%.5f');
    don{3} = ' ';
    don{4} = 'B Matrisi';
    don{5} = num2str(B, '%.5f');
    don{6} = ' ';
    don{7} = 'Bul Matrisi';
    don{8} = num2str(bul, '%.5f');
    V = don;
end