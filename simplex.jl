function pivot(Binv, cB, A, b, c, entering, leaving)
    d = Binv * A[:, entering]
    ratio = b ./ d
    min_ratio, min_index = findmin(ratio)
    Binv[:, leaving] = Binv[:, leaving] / d[leaving]
    for i in 1:length(b)
        if i != leaving
            Binv[:, i] = Binv[:, i] - d[i] * Binv[:, leaving]
        end
    end
    cB[leaving] = c[entering]
    return Binv, cB
end

function simplex(Binv, cB, A, b, c)
    while true
        reduced_cost = c' - cB' * Binv * A
        if all(reduced_cost .>= 0)
            return Binv * b
        end
        entering = findfirst(reduced_cost .< 0)
        d = Binv * A[:, entering]
        if all(d .<= 0)
            error("Problem is unbounded")
        end
        ratio = b ./ d
        min_ratio, leaving = findmin(ratio)
        Binv, cB = pivot(Binv, cB, A, b, c, entering, leaving)
    end
end

A = [1/6 1/4; 1/2 1/4; 1/3 1/2]
b = [60; 60; 90]
c = [3; 4]
Binv = [1/6 0 0; 0 1/4 0; 0 0 1/2]
Binv = [1 0 0; 0 1 0; 0 0 1]
cB = [0; 0; 0]

# Solve the problem using the Simplex method
solution = simplex(Binv, cB, A, b, c)

# Print the solution
println("The optimal solution is: ", solution)