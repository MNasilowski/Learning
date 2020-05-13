%Wczytujemy dane wej�ciowe z pliku
M = csvread('ucz.csv');
%Dzielimy dane na wej�ciowe i wyj�ciowe
input = M(:,1:2);
output = M(:,3);
%Ustalamy wsp�czynnik uczenia i krzywizny
coeff = 6;
b1 = 1;
itteration = 10000;
% i tworzymy kilka innych zmiennych pomocnicznych:
A = 1:length(input(:,1));
B = 1:length(input(:,1));
B = B.*0;
%Ustalamy losowe wagi:
W = tworz(input,output,coeff, b1 ,0);
%Wyniki klasyfikacji przed uczeniem A:
for i = 1: length(input(:,1))
    A(i) = dzialaj(W,input(i,:),b1);
end
A
%Sprawdzamy jak zadzia�a. W celu zwi�kszenia skuteczno�� u�redniam po 10
%iteracjach z r�nymi wagami pocz�tkowymi
for j = 1:10
    W = tworz(input,output,coeff, b1 ,itteration);
    for i = 1: length(input(:,1))
        B(i) = B(i) +  dzialaj(W,input(i,:),b1);
    end
end
B = B./ 10;
%Ze wzgl�du na ci�g�o�� funkcji uczenia i dyskretno�� warto�ci logicznych
%dzielimy warto�� B na klasy
for i = 1: length(input(:,1))
    if B(i) < 0.45
        B(i) = 0;
    elseif B(i) > 0.55
        B(i) = 1;
    else
        B(i) = 2;
    end
end
B


