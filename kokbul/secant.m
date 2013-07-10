function [x1, adim] = secant(fonk, As, Us, x0, x1, E)
    adim = 1;
    if fonk(As) * fonk(Us) > 0       % aral�k kontrolu yapt�g�m�z yer
        x1 = 'alt sinirla �st sinirin fonksiyon ��kd� sonu�lar� �arp�m� 0 dan buyuk olamaz!!!';
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