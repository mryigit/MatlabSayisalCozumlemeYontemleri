function [x0, adim] = regularfalsi(fonk, As, Us, E)
    adim = 1;
    if fonk(As) * fonk(Us) > 0       % aral�k kontrolu yapt�g�m�z yer
        x0 = 'alt sinirla �st sinirin fonksiyon ��kd� sonu�lar� �arp�m� 0 dan buyuk olamaz!!!';
        adim = ' ';
        return;
    else
       
       %regularfalsi formulunu( xn=[a.f(b)-b.f(a)]/f(b)-f(a) ) x0 ve x1 degerleri icin kullan�yoruz
       % bu degerler yard�m�yla program�m�z duracak
       x0 = ( (fonk(As) * Us) - (fonk(Us) * As) ) / (fonk(As) - fonk(Us));
       x1 = ( (fonk(x0) * Us) - (fonk(Us) * x0) ) / (fonk(x0) - fonk(Us));
       while abs(x1 - x0) > E  % durma kosulu |x1-x0|<epsilon oldugunda program sonlan�cak ve bizden istenen
          
           x0 = ( (fonk(As) * Us) - (fonk(Us) * As) ) / (fonk(As) - fonk(Us)); %yukardkai islemi burdada yap�yoruz
           x1 = ( (fonk(x0) * Us) - (fonk(Us) * x0) ) / (fonk(x0) - fonk(Us));% cunku alt sinir ve ust sinir degerlerimiz
           %surekli olarak duruma gore guncelleniyor
           if fonk(As) * fonk(x0) < 0
               Us = x0;
               
           elseif fonk(Us) * fonk(x0) < 0
               As = x0;
           end
           adim = adim + 1;
       end
    end
    
    
end
    