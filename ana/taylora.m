function V = taylora(fonk,x0,x1,n)
% n derece n. derece taylor gibi
% x0 ve x1 verilen 2 deger aralik gibi bise
%fonk da tan�ml�can fonksiyon
    t=0;
    syms x; % x degiskenini syms ile tan�ml�oz bolece x variable bir deger oluyor
    deger=0;
    
    
    while t <= n
        f=inline(diff(fonk(x),t)); %t den n e kadar fonksiyonun turevlerini burda al�oz
        
        x2=(f(x0)/factorial(t))*(x1-x0)^t; % formulu uyguluyoruz her bir turev basamag� icin
        
        deger=deger+x2;  %olusan degerleri burda topluyoruz
        t=t+1;
    end
    fh=inline(diff(fonk(x),n+1));  %hata formulu icin fonksiyonun turevini ald�m�z yer
    hata = abs((fh(x0)/factorial(n+1))*(x1-x0)^(n+1));  % hatay� hesaplad�m�z yer
    
    V = deger+hata; % ve son olarak hata ile degeri toplayarak n icin yaklas�k deger bulmus oluyoz
end