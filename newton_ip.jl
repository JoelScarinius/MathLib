function intpolc(x, f)
    m = length(x) # number of interpolation points
    for k = 2:m
        f[k:end] .= (f[k:end] .- f[k-1:end-1]) ./ (x[k:end] .- x[1:end+1-k])
    end
    return f
end

function intpval(x, c, t)
    m = length(x) # number of interpolation points and coeffs
    p = c[m] * ones(size(t))
    for k = m-1:-1:1
        p .= p .* (t .- x[k]) .+ c[k]
    end
    return p
end

# Example usage:
x = [-2.0, -1.0, 0.0, 1.0]
x = [-0.20, -0.21, 0.22, 0.23]
f = [0.016, 0.006, -0.004, -0.014]
x = [1, 2, 3, 4]
f = [1, 8, 9, 16]
c = intpolc(x, f)
t = [5]
p = intpval(x, c, t)
println("Interpolation coefficients c: ", c)
println("Interpolated values at t: ", p)