function [x1, adim] = newtrap(turfonk, fonk , As , Us, x0, E)
    adim = 1;
    
    if fonk(As) * fonk(Us) > 0  
        x1 = 'alt sinirla üst sinirin fonksiyon çýkdý sonuçlarý çarpýmý 0 dan buyuk olamaz!!!';
        adim = ' ';
        return;
    elseif  turfonk(x0) == 0      
        x1 = 'fonksiyonun turevine X0 degeri verildiðinde 0 sonucu elde edilemez';
        adim = ' ';
        return;
    else
        
        x1 = x0 - (fonk(x0) / turfonk(x0)); 
        while abs(x1 - x0) > E         
            
            if turfonk(x0) == 0
                x1 = 'fonksiyonun turevine X0 degeri verildiðinde 0 sonucu elde edilemez';
                adim = ' ';
                return;
            else
            x0 = x1; 
            x1 = x0 - (fonk(x0) / turfonk(x0));
            end
            adim=adim+1;
        end
        
    end 
end