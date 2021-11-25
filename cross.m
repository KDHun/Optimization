function [c1 , c2] = cross(p1 , p2, Pc)
        n = length(p1.var);
        d1 = ceil(rand() * (n - 1));
        d2 = d1 + ceil(rand() * (n - d1));
        cp1 = p1.var(1: d1);
        cp2 = p2.var(d1 + 1: d2);
        cp3 = p1.var(d2 + 1: end);
        c1.var = [cp1 , cp2 , cp3];
        cp1 = p2.var(1:d1);
        cp2 = p1.var(d1 + 1: d2);
        cp3 = p2.var(d2 + 1: end);
        c2.var = [cp1 , cp2 , cp3];
        if rand() > Pc
            c1 = p1;
        end
        if rand() > Pc
            c2 = p2;
        end
end