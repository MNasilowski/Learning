close all, clear all, clc, format compact
% XOR input for x1 and x2
M = csvread('ucz.csv');
input = M(:,1:2);
% Desired output of XOR
output = M(:,3);
p = 100;
wyn = rand(p,p);
A = 1:p;
B = 1:p;
b = 1;

for m = 1: 10
W = tworz(input,output,6, 1 ,10000);
for j = 1:p
    A(j) = j*0.02-0.5;
for k = 1:p
    B(k) = k*0.02- 0.5;
a = dzialaj(W,[A(j), B(k)],b);
wyn(j,k) = wyn(j,k) + a;
end
end
end


for j = 1:p
for k = 1:p
    if wyn(j,k) < 5
        wyn(j,k) = 0;
    else
        wyn(j,k) = 1;
    end
end
end

pcolor(A,B,wyn)
hold on
plot(M(:,1),M(:,2),'r*');
hold of



    