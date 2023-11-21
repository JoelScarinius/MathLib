function bisection(f, a0, b0, tol)
    a = a0
    b = b0
    sfb = sign(f(b))  # Initialize

    while (b - a) > tol
        x = (a + b) / 2
        sfx = sign(f(x))
        println([a, b, sfx])

        if sfx == 0  # f(x) = 0
            a = x
            b = x
            break  # Return with a = b = x
        elseif sfx == sfb
            b = x
        else
            a = x
        end
    end

    return (a, b)
end

function fx(x)
    return x - cos(x)
end

(a, b) = bisection(fx, 0.7, 0.8, 1e-3)