function fixed_point(g, x0, max_iter, tolerance)
    x = x0
    for k in 0:max_iter
        x_next = g(x)
        println("$k  $(@sprintf("%.10f", x))  $(@sprintf("%.10e", x_next - x))")
        if abs(x_next - x) < tolerance
            println("Converged to a fixed point: $x_next")
            break
        end
        x = x_next
    end
end

#Define the fixed - point function
# You can change this function as needed
# g(x) = cos(x)  
g(x) = x - (1/70) * (x^5 - 10x - 1 )

# x0 = 0.7
# x0 = pi
x0 = 2
max_iter = 5
tolerance = 1e-2  # Adjust the tolerance as needed

println("k                 x_k")

fixed_point(g, x0, max_iter, tolerance)
