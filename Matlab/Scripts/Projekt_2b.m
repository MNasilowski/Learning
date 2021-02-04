%Wczytujemy dane wej�ciowe z pliku
M = csvread('ucz.csv');
%Dzielimy dane na wej�ciowe i wyj�ciowe
input = M(:,1:2);
output = M(:,3);
%Ustalamy wsp�czynnik uczenia i krzywizny
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

%Sprawdzamy jak zadzia�a. W celu zwi�kszenia skuteczno�� u�redniam po 10
%iteracjach z r�nymi wagami pocz�tkowymi
    W = tworz(input,output,coeff, b1 ,itteration);
    for i = 1: length(input(:,1))
        B(i) = B(i) +  dzialaj(W,input(i,:),b1);
        %   i od razu przypisujemy odpowiednia kategori�
        B(i) = klasyfikuj(B(i));
    end
   s = skut(input,output,coeff, b1 ,itteration);

    fprintf('dane wej�ciowe \n')
    disp(input)   
    fprintf('Wynik przed uczeniem \n')
    disp(A')
    fprintf('Wynik po uczeniu \n')
    disp(B')
    fprintf('skuteczno�� uczenia \n')
    disp(s);
    



