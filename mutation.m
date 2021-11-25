function child = mutation(child, Pm)
    var_no = length(child.var);
    for k = 1: var_no
        child.var(k) = abs(child.var(k) + Pm * randn());
    end
end