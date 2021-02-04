%Wczytujemy dane wejœciowe z pliku
M = csvread('ucz.csv');
%Dzielimy dane na wejœciowe i wyjœciowe
input = M(:,1:2);
output = M(:,3);
%Ustalamy wspó³czynnik uczenia i krzywizny
coeff = 6;
b1 = 1;
itteration = 5000;
    
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

%Sprawdzamy jak zadzia³a. W celu zwiêkszenia skutecznoœæ uœredniam po 10
%iteracjach z ró¿nymi wagami pocz¹tkowymi
    W = tworz(input,output,coeff, b1 ,itteration);
    for i = 1: length(input(:,1))
        B(i) = B(i) +  dzialaj(W,input(i,:),b1);
        %   i od razu przypisujemy odpowiednia kategoriê
        B(i) = klasyfikuj(B(i));
    end
   s = skut(input,output,coeff, b1 ,itteration);

    fprintf('dane wejœciowe \n')
    disp(input)   
    fprintf('Wynik przed uczeniem \n')
    disp(A')
    fprintf('Wynik po uczeniu \n')
    disp(B')
    fprintf('skutecznoœæ uczenia \n')
    disp(s);
    



