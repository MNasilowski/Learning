%Wczytujemy dane wejœciowe z pliku
M = csvread('ucz.csv');
%Dzielimy dane na wejœciowe i wyjœciowe
input = M(:,1:2);
output = M(:,3);
%Ustalamy wspó³czynnik uczenia i krzywizny
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
%Sprawdzamy jak zadzia³a. W celu zwiêkszenia skutecznoœæ uœredniam po 10
%iteracjach z ró¿nymi wagami pocz¹tkowymi
for j = 1:10
    W = tworz(input,output,coeff, b1 ,itteration);
    for i = 1: length(input(:,1))
        B(i) = B(i) +  dzialaj(W,input(i,:),b1);
    end
end
B = B./ 10;
%Ze wzglêdu na ci¹g³oœæ funkcji uczenia i dyskretnoœæ wartoœci logicznych
%dzielimy wartoœæ B na klasy
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


