function V = taylora(fonk,x0,x1,n)
% n derece n. derece taylor gibi
% x0 ve x1 verilen 2 deger aralik gibi bise
%fonk da tanýmlýcan fonksiyon
    t=0;
    syms x; % x degiskenini syms ile tanýmlýoz bolece x variable bir deger oluyor
    deger=0;
    
    
    while t <= n
        f=inline(diff(fonk(x),t)); %t den n e kadar fonksiyonun turevlerini burda alýoz
        
        x2=(f(x0)/factorial(t))*(x1-x0)^t; % formulu uyguluyoruz her bir turev basamagý icin
        
        deger=deger+x2;  %olusan degerleri burda topluyoruz
        t=t+1;
    end
    fh=inline(diff(fonk(x),n+1));  %hata formulu icin fonksiyonun turevini aldýmýz yer
    hata = abs((fh(x0)/factorial(n+1))*(x1-x0)^(n+1));  % hatayý hesapladýmýz yer
    
    V = deger+hata; % ve son olarak hata ile degeri toplayarak n icin yaklasýk deger bulmus oluyoz
end