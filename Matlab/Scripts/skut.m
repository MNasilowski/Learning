function s = skut(input,output,coeff, b1 ,itteration)
%Sprawdzamy jak zadzia�a. W celu zwi�kszenia skuteczno�� u�redniam po 10
%iteracjach z r�nymi wagami pocz�tkowymi
s = 0;
n = length(input(:,1));
for i = 1:10
    W = tworz(input,output,coeff, b1 ,itteration);
    for i = 1: length(input(:,1))
        B = dzialaj(W,input(i,:),b1);
        %   i od razu przypisujemy odpowiednia kategori�
        if B < 0.25
            B = 0;
        elseif B > 0.75
            B = 1;
        else
            B = 2;
        end
        if B == output(i)
            s = s + 1;
        end
    end
end
s = s*0.1/n;
    
   
        