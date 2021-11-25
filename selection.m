function [parent1, parent2] = selection(population)

M = length(population.mem(:));

if any([population.mem(:).fit] < 0 ) 
    % fit scaling in case of negative values scaled(f) = a * f + b
    a = 1;
    b = abs( min(  [population.mem(:).fit] )  );
    Scaled_fit = a *  [population.mem(:).fit] + b;
    
    normalized_fit = [Scaled_fit] ./ sum([Scaled_fit]);
else
    normalized_fit = [population.mem(:).fit] ./ sum([population.mem(:).fit]);
end



%normalized_fit = [population.mem(:).fit] ./ sum([population.mem(:).fit]);

[~ , sorted_idx] = sort(normalized_fit , 'descend');

for i = 1 : length(population.mem)
    temp_population.mem(i).var = population.mem(sorted_idx(i)).var;
    temp_population.mem(i).fit = population.mem(sorted_idx(i)).fit;
    temp_population.mem(i).normalized_fit = normalized_fit(sorted_idx(i));
end


cumsum = zeros(1 , M);

for i = 1 : M
    for j = i : M
        cumsum(i) = cumsum(i) + temp_population.mem(j).normalized_fit;
    end
end


R = rand(); % in [0,1]
parent1_idx = M;
for i = 1: length(cumsum)
    if R > cumsum(i)
        parent1_idx = i - 1;
        break;
    end
end

parent2_idx = parent1_idx;
while_loop_stop = 0; % to break the while loop in rare cases where we keep getting the same index
while parent2_idx == parent1_idx
    while_loop_stop = while_loop_stop + 1;
    R = rand(); % in [0,1]
    if while_loop_stop > 20
        break;
    end
    for i = 1: length(cumsum)
        if R > cumsum(i)
            parent2_idx = i - 1;
            break;
        end
    end
end

parent1 = temp_population.mem(parent1_idx);
parent2 = temp_population.mem(parent2_idx);

end