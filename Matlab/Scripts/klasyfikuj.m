function b = klasyfikuj(b) 
        if b < 0.25
            b = 0;
        elseif b > 0.75
            b = 1;
        else
            b = 2;
        end