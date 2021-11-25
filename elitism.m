function newPop  = elitism(oldPop , pop, Er)
    M = length(oldPop.mem);
    N = round(M * Er);
    [~ , indx] = sort([ oldPop.mem(:).fit ] , 'descend');
    for k = 1 : N
        newPop.mem(k).var  = oldPop.mem(indx(k)).var;
        newPop.mem(k).fit  = oldPop.mem(indx(k)).fit;
    end
    for k = N + 1 :  M
        newPop.mem(k).var  = pop.mem(k).var;
        newPop.mem(k).fit  = pop.mem(k).fit;
    end
end