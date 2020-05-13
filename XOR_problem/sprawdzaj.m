
% XOR input for x1 and x2
M = csvread('Entry.csv');
input = M(:,1:2);
% Desired output of XOR
output = M(:,3);
%input = [ 0 0; 1 1 ; % wejœcia sieci
%0 1; 1 0 ];
%output = [ 0; 0; 1; 1 ]; % ¿¹dane wyjœcie sieci
iterations = 10000;
% Initialize the bias
% wspó³czynnik krzywizny
skutecznosc = 1:100;
coeff = 5;
b = 1.1;
for j = 1: 100
    iterations = j*100;
% Learning coefficient
a1 = 0; a2 = 0; a3 = 0; a4 = 0;
for i = 0: 100
W = tworz(input,output,coeff, b ,iterations);
a1 = a1 + dzialaj(W,[0 0],b);
a2 = a2 + dzialaj(W,[0 1],b);
a3 = a3 + dzialaj(W,[1 0],b);
a4 = a4 + dzialaj(W,[1 1],b);
end
skutecznosc(j) = ((100 - a1) + a2 + a3 + (100 -a4))*0.25;
end
Y = skutecznosc(j) / 100;
X = 1:100;
X = X*100;

    