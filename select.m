function [parent1, parent2] = select(population)
M = length(population.mem(:));
p1 = ceil(abs(rand() * M));
p2 = ceil(abs(rand() * M));
p1 = (p1 > M) * M + (p1 <= M) * p1;
p2 = (p2 > M) * M + (p2 <= M) * p2;
parent1 = population.mem(p1);
parent2 = population.mem(p2);
end