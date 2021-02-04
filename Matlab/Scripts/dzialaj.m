function out = dzialaj(weights,input,b)
    bias = [-1 -1 -1];
    H1 = bias(1,1)*weights(1,1) + input(1)*weights(1,2) + input(2)*weights(1,3);
    x2(1) = sigma(H1,b);
    H2 = bias(1,2)*weights(2,1) + input(1)*weights(2,2) + input(2)*weights(2,3);
    x2(2) = sigma(H2,b);
    x3_1 = bias(1,3)*weights(3,1) + x2(1)*weights(3,2) + x2(2)*weights(3,3);
    out = sigma(x3_1,b);