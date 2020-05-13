function W = tworz(input,output,coeff, b ,iterations)
%funkcja tworz�ca wagi sieci neuronowej sk�adaj�cej si� z dw�ch warstw i 2
%neuron�w w warstwie ukrytej.

%   input      macierz zawieraj�ca dane ucz�ce
%   output     macierz zawieraj�ca oczekiwane wyniki uczenia
%   coeff      wsp�czynni uczenia
%   b          wsp�czynnik kierunkowy funkcji sigmoidalnej

%dodajemy bias
bias = [-1 -1 -1];
%i losowe warto�ci wag na pocz�tek.
rand('state',sum(100*clock));
weights = -1 +2.*rand(3,3);
%sprawdzamy liczb� danych pocz�tkowych
numIn = length (input(:,1));
% i rozpoczynamy propagacj� wsteczn�
for i = 1:iterations
    j = randi(numIn);
    
%obliczamy warto�� wyj�ciow� z pierwszego neuronu  
%H = wagi razy wej�cie
%X = wyj�cie z neuronu
    H1 = bias(1,1)*weights(1,1) + input(j,1)*weights(1,2) + input(j,2)*weights(1,3); 
    x2(1) = sigma(H1,b);
%drugiego neuronu    
    H2 = bias(1,2)*weights(2,1) + input(j,1)*weights(2,2) + input(j,2)*weights(2,3);
    x2(2) = sigma(H2,b);
%oraz z trzeciego neuronu czyli ostateczne wyj�cie z sieci.
    x3_1 = bias(1,3)*weights(3,1) + x2(1)*weights(3,2) + x2(2)*weights(3,3);
    out = sigma(x3_1,b);   
%Ka�dy neuron wyj�ciowy oblicza sw�j b��d, oparty na r�nicy pomi�dzy 
% poprawn� odpowiedzi� oraz �eczywist�: output - out
%i od razu mno�ymy ten b��d przez pochodn� funkcji aktwacji neuronu
%b*out*(1-out)
% dla zewn�trznej warstwy:
    delta3_1 = b*out*(1-out)*(output(j)-out);
%dla warstw wewn�trznych b��d wynosi:
%pochodna funkcji aktywacji * waga po��czenia * b��d warstwy wy�szej
%poniewa� neurony warstwy wewn�trznej maj� tylko jedno po��czenie z warstw�
%zewn�trzn�:
    delta2_1 = b*x2(1)*(1-x2(1))*weights(3,2)*delta3_1;
    delta2_2 = b*x2(2)*(1-x2(2))*weights(3,3)*delta3_1;
%Maj�c obliczone b��dy mo�emy w odpowiedni spos�b zmodyfikowa� wagi
    for k = 1:3
        if k == 1 % Bias cases
            weights(1,k) = weights(1,k) + coeff*bias(1)*delta2_1;
            weights(2,k) = weights(2,k) + coeff*bias(2)*delta2_2;
            weights(3,k) = weights(3,k) + coeff*bias(3)*delta3_1;
        else % When k=2 or 3 input cases to neurons
            weights(1,k) = weights(1,k) + coeff*input(j,1)*delta2_1;
            weights(2,k) = weights(2,k) + coeff*input(j,2)*delta2_2;
            weights(3,k) = weights(3,k) + coeff*x2(k-1)*delta3_1;
        end
    end
%Ca�o�� powtarzamy itteration razy
end
%Na wyj�ciu dostajemy macierz wag o wymiarach 3 na 3
W = weights;