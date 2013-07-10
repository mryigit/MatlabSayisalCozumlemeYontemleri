function X =GaussJordan(A,B)
[n,n1] = size(A); 
[m1,p] = size(B);

%Programda A'nýn kare matris olmasý için n=n1 olmalý
%Ve matris çarpýmý yapabilmek için n1=m1 olmalý (n=n1=m1)
if n~=n1
    X = 'A kare matris olmak zorundadýr!!!';
    return
elseif n~=m1
    X = 'A ve B ayný satýr sayýsýna sahip olmalý!!!';
    return
else
    C = [A B];
    for i = 1:n-1
        [pivot,k] = max(abs(C(i:n,i)));
        %k pivot'un pozisyonudur. i.satýrla iliþkilidir
        %i'den n'ye kadar satýr kontolü yapar.
        if k > 1
            temp1 = C(i, :);   C(i, :) = C(i+k-1, :);  C(i+k-1, :) = temp1;
            %bildiðimiz swap iþlemi yaptýk.
        end
        m(i+1:n, i) = -C(i+1:n, i)/C(i,i);
        C(i+1:n, :) =  C(i+1:n, :) + m(i+1:n, i)*C(i, :);       
    end
    for i = n : -1 : 2
        for k = i-1 : -1 : 1 %satýrýn altýndaki pivot satýrýný güncelliyoruz.
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