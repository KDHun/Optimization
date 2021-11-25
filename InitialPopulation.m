function population = InitialPopulation(M, N)
for i = 1 : M
    for j = 1 : N 
        population.mem(i).var(j) = rand();
    end
end
