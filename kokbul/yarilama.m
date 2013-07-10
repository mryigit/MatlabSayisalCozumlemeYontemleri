function [ort,adim] = yarilama(fonk, As, Us, E)
    adim = 1;
    
    if fonk(As) * fonk(Us) > 0       % aralik uyumlulugu kontrol ettigimiz kisim 
        ort = 'alt sinirla üst sinirin fonksiyon çýkdý sonuçlarý çarpýmý 0 dan buyuk olamaz!!!';
        adim = ' ';
        return;
    else
        
        %%
        while abs(As - Us) > E  % bizden istenen hassasiyet saglanana kadar ayni islemler devam eder
            ort = (As + Us) / 2;    % verilen araligin ortalamasini alarak koke yaklasmayý deniyoruz
            
            %% bize verilen alt snir ve ust siniri kullanarak elde ettimiz
            %ortalama degerin yeni alt sýnýrmý yoksa yeni ust sýnýrmý
            %olduguna  programýn kara verdigi kýsým
            if fonk(As) * fonk(ort) <= 0 % eger alt sýnýrýn denklemdeki islemi sonucuyla 
                Us = ort;               %ortalamanýn denklemdeki sonucu carpýmý 0 dan kucukse
                                   % Ust sýnýr olarak ortalamayý alýyorzu
                 
            elseif fonk(Us) * fonk(ort) <= 0 %eger ortalama ile ust sinir denklem sonucu carpimi
                As = ort;               % 0 dan kucuk se al sinir degerini guncelliyoruz
            end
            
            adim = adim + 1;
       
        end
    end
    
end
            
            
