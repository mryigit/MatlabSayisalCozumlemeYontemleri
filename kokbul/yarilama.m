function [ort,adim] = yarilama(fonk, As, Us, E)
    adim = 1;
    
    if fonk(As) * fonk(Us) > 0       % aralik uyumlulugu kontrol ettigimiz kisim 
        ort = 'alt sinirla �st sinirin fonksiyon ��kd� sonu�lar� �arp�m� 0 dan buyuk olamaz!!!';
        adim = ' ';
        return;
    else
        
        %%
        while abs(As - Us) > E  % bizden istenen hassasiyet saglanana kadar ayni islemler devam eder
            ort = (As + Us) / 2;    % verilen araligin ortalamasini alarak koke yaklasmay� deniyoruz
            
            %% bize verilen alt snir ve ust siniri kullanarak elde ettimiz
            %ortalama degerin yeni alt s�n�rm� yoksa yeni ust s�n�rm�
            %olduguna  program�n kara verdigi k�s�m
            if fonk(As) * fonk(ort) <= 0 % eger alt s�n�r�n denklemdeki islemi sonucuyla 
                Us = ort;               %ortalaman�n denklemdeki sonucu carp�m� 0 dan kucukse
                                   % Ust s�n�r olarak ortalamay� al�yorzu
                 
            elseif fonk(Us) * fonk(ort) <= 0 %eger ortalama ile ust sinir denklem sonucu carpimi
                As = ort;               % 0 dan kucuk se al sinir degerini guncelliyoruz
            end
            
            adim = adim + 1;
       
        end
    end
    
end
            
            
