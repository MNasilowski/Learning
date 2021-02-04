function W = tworz(input,output,coeff, b ,iterations)
%funkcja tworz¹ca wagi sieci neuronowej sk³adaj¹cej siê z dwóch warstw i 2
%neuronów w warstwie ukrytej.

%   input      macierz zawieraj¹ca dane ucz¹ce
%   output     macierz zawieraj¹ca oczekiwane wyniki uczenia
%   coeff      wspó³czynni uczenia
%   b          wspó³czynnik kierunkowy funkcji sigmoidalnej

%dodajemy bias
bias = [-1 -1 -1];
numIn = length (input(:,1));
suma = 0;
%i losowe wartoœci wag na pocz¹tek.

    rand('state',sum(100*clock));
    weights = -1 +2.*rand(3,3);
    %sprawdzamy liczbê danych pocz¹tkowych
    
    % i rozpoczynamy propagacjê wsteczn¹
    for i = 1:iterations
        j = randi(numIn);
        %obliczamy wartoœæ wyjœciow¹ z pierwszego neuronu
        %H = wagi razy wejœcie
        %X = wyjœcie z neuronu
        H1 = bias(1,1)*weights(1,1) + input(j,1)*weights(1,2) + input(j,2)*weights(1,3);
        x2(1) = sigma(H1,b);
        %drugiego neuronu
        H2 = bias(1,2)*weights(2,1) + input(j,1)*weights(2,2) + input(j,2)*weights(2,3);
        x2(2) = sigma(H2,b);
        %oraz z trzeciego neuronu czyli ostateczne wyjœcie z sieci.
        H3 = bias(1,3)*weights(3,1) + x2(1)*weights(3,2) + x2(2)*weights(3,3);
        out = sigma(H3,b);
        %Ka¿dy neuron wyjœciowy oblicza swój b³¹d, oparty na ró¿nicy pomiêdzy
        % poprawn¹ odpowiedzi¹ oraz ¿eczywist¹: output - out
        %i od razu mno¿ymy ten b³¹d przez pochodn¹ funkcji aktwacji neuronu
        %b*out*(1-out)
        % dla zewnêtrznej warstwy:
        delta3_1 = b*out*(1-out)*(output(j)-out);
        %dla warstw wewnêtrznych b³¹d wynosi:
        %pochodna funkcji aktywacji * waga po³¹czenia * b³¹d warstwy wy¿szej
        %poniewa¿ neurony warstwy wewnêtrznej maj¹ tylko jedno po³¹czenie z warstw¹
        %zewnêtrzn¹:
        delta2_1 = b*x2(1)*(1-x2(1))*weights(3,2)*delta3_1;
        delta2_2 = b*x2(2)*(1-x2(2))*weights(3,3)*delta3_1;
        %Maj¹c obliczone b³êdy mo¿emy w odpowiedni sposób zmodyfikowaæ wagi
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
        %Ca³oœæ powtarzamy itteration razy
    end

    
W = weights;