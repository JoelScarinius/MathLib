using Printf

function fdf(x)
    f = x - sqrt(pi + x)
    df = 1 - (1 / (2 * (sqrt(pi + x))))
    return f, df
end

println("k                    x_k                   f'(x_k)               dx")

function newton_raphson(x0, max_iter)
    x = x0
    for k in 0:max_iter
        f, df = fdf(x)
        dx = f / df
        x = x - dx
        println("$k  $(@sprintf("%.14f", x))  $(@sprintf("%.14e", f))  $(@sprintf("%.14e", df)) $(@sprintf("%.14e", dx))")
    end
end

x0 = pi
max_iter = 5
newton_raphson(x0, max_iter)