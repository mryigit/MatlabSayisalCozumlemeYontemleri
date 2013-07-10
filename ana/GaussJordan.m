function X =GaussJordan(A,B)
[n,n1] = size(A); 
[m1,p] = size(B);

%Programda A'n�n kare matris olmas� i�in n=n1 olmal�
%Ve matris �arp�m� yapabilmek i�in n1=m1 olmal� (n=n1=m1)
if n~=n1
    X = 'A kare matris olmak zorundad�r!!!';
    return
elseif n~=m1
    X = 'A ve B ayn� sat�r say�s�na sahip olmal�!!!';
    return
else
    C = [A B];
    for i = 1:n-1
        [pivot,k] = max(abs(C(i:n,i)));
        %k pivot'un pozisyonudur. i.sat�rla ili�kilidir
        %i'den n'ye kadar sat�r kontol� yapar.
        if k > 1
            temp1 = C(i, :);   C(i, :) = C(i+k-1, :);  C(i+k-1, :) = temp1;
            %bildi�imiz swap i�lemi yapt�k.
        end
        m(i+1:n, i) = -C(i+1:n, i)/C(i,i);
        C(i+1:n, :) =  C(i+1:n, :) + m(i+1:n, i)*C(i, :);       
    end
    for i = n : -1 : 2
        for k = i-1 : -1 : 1 %sat�r�n alt�ndaki pivot sat�r�n� g�ncelliyoruz.
            m = -C(k,i)/C(i,i);
            C(k,i) = C(k,i) + m*C(i,i);
            C(k, n+1:n+p) = C(k, n+1:n+p)+m*C(i, n+1:n+p);
        end
    end
    for i = 1:n
        C(i, n+1:n+p) = C(i, n+1:n+p)/C(i,i);
        C(i,i)=1;
    end
end
X = C( : ,n+1:n+p);
end