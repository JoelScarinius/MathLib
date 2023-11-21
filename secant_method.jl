using Printf

function fx(x)
    return x - exp(-x)
end

# Initial values
xx = [0.55, 0.575]
ff = fx.(xx)

println("k  x_k                f(x_k)                 x_k - x*")

for k in 0:4
    nx = xx[2] - ff[2] * (xx[2] - xx[1]) / (ff[2] - ff[1])
    xx[1] = xx[2]
    xx[2] = nx
    ff[1] = ff[2]
    ff[2] = fx(nx)
    x_diff = xx[2] - 0.56714329040994  # Replace 0.73908513399236 with your reference solution
    println("$k  $(@sprintf("%.14f", xx[2]))  $(@sprintf("%.14e", ff[2]))  $(@sprintf("%.14e", x_diff))")

end
