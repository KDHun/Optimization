function [BestChrom, cong]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , obj, RealImage, BlurredImage)
    cong = zeros(1 , MaxGen);
    [pop] = InitialPopulation(M, N);
    for i = 1 : M
        pop.mem(i).fit = obj( pop.mem(i).var(:), BlurredImage, RealImage);
    end

    gen = 1;
    [~ , ind] = sort([ pop.mem(:).fit ] , 'descend');
    cong(gen) = pop.mem(ind(1)).fit;
    for gen = 2 : MaxGen
        for k = 1: 2: M
            [p1, p2] = selection(pop);
            [c1 , c2] = cross(p1 , p2, Pc);
            c1 = mutation(c1, Pm);
            c2 = mutation(c2, Pm);

            newPop.mem(k).var = c1.var;
            newPop.mem(k+1).var = c2.var;
        end
        for i = 1 : M
            newPop.mem(i).fit = obj( newPop.mem(i).var(:), BlurredImage, RealImage);
        end
        newPop = elitism(pop, newPop, Er);
        cong(gen) = newPop.mem(1).fit;
        pop = newPop;
        BestChrom.var = pop.mem(1).var;
        BestChrom.fit = pop.mem(1).fit;
        disp(BestChrom.var);
    end
end