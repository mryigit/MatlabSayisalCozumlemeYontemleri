function V = birinci_dereceden_spline(veri1)
    
    x  = veri1(:, 1);
    fx = veri1(:, 2);
    liste = {};
    len_veri = length(x) - 1;
    
    si = zeros(len_veri, 2);
	
    for i = 1: len_veri
        si(i, 1) = fx(i);
        si(i, 2) = (fx(i + 1) - fx(i)) / (x(i + 1) - x(i));
    end
    for i = 1: len_veri
        liste{i} = strcat('s(', num2str(i), ') =  ', num2str(si(i, 1)), ' + (', num2str(si(i, 2)), ')(x - ', num2str(si(i, 1)), ')');
        
    end
    V=liste;
    
end