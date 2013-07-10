function [V,Y] = Jacobi(A, b, x0, tol, max_it)
% A      ----------->>>>  Matrisin Katsay�lar�
% b      ----------->>>>  Sa� taraf
% x0     ----------->>>>  �lk ��z�m
% tol    ----------->>>>  �rnek e�er x<tol ise dur.
% max_it ----------->>>>  maksimum iterasyon say�s�
% x      ----------->>>>  ��z�m vekt�r�
[n m] = size(A);
xold = x0;
C = -A;
    for i=1:n
        C(i,i)=0;
    end
    
    for i=1:n
        C(i,:) = C(i,:)/A(i,i);
    end
    
    for i=1:n
        d(i,1) = b(i)/A(i,i);
    end
    i=1;

    while(i<=max_it)
        xnew = C * xold + d;
        if norm(xnew-xold) <= tol
            B = round(xnew);
            V = B;
            Y = i;
            return;
        else
            xold = xnew;
        end
        i=i+1;
    end
    V=xnew;
    Y = i;
end