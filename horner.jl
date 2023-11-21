function horner(a, x)
    p = a[1]
    for i = 2:length(a)
        p = p * x + a[i]
    end
    return y
end

p = horner([1, 2, 3], 2)
println(p)