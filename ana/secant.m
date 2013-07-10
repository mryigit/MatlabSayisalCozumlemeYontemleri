function [x1, adim] = secant(fonk, As, Us, x0, x1, E)
    adim = 1;
    if fonk(As) * fonk(Us) > 0       % aralýk kontrolu yaptýgýmýz yer
        x1 = 'alt sinirla üst sinirin fonksiyon çýkdý sonuçlarý çarpýmý 0 dan buyuk olamaz!!!';
        adim = ' ';
        return; 
    else
         while abs(x1 - x0) > E
             x2 = x1 - ( (fonk(x1) * (x1 - x0)) / (fonk(x1) - fonk(x0)) );
             x0 = x1;
             x1 = x2;
             adim = adim + 1;
         end
    end
    
end