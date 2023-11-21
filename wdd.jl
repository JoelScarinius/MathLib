function wDD(di, yi, col=100)
    n = length(di)
    lastcol = min(n, col + 1)

    Y = copy(yi)  # Initialize the return array

    for j in 1:lastcol-1
        for i in 1:n-j
            Y[i] = (di[i] * Y[i+1] - di[i+j] * Y[i]) / (di[i] - di[i+j])
        end
    end

    if lastcol < n
        return Y[1:n-lastcol+1]
    else
        return Y[1]  # Return a scalar, not a list
    end
end

# # Example usage:
# di = [1, 2, 3, 4]
# yi = [2, 4, 6, 8]

# result = wDD(di, yi)
# println(result)

# Given data points
xi = [1, 2, 3, 4]
x3i = [1^3, 2^3, 3^3, 4^3]  # Corrected to use x^3

# Evaluate the weighted divided differences using the provided routine
result = wDD(xi, x3i)
println(result)

# # Neville's algorithm to evaluate p3(x) at x = 5
# function neville_eval(x, xi, yi)
#     n = length(xi)
#     Q = copy(yi)
#     for k in 2:n
#         for i in 1:n-k+1
#             Q[i] = ((x - xi[i+k-1]) * Q[i] + (xi[i] - x) * Q[i+1]) / (xi[i] - xi[i+k-1])
#         end
#     end
#     return Q[1]
# end

# # Evaluate p3(x) at x = 5
# x_value = 5
# p3_at_5 = neville_eval(x_value, xi, result)

# println("p3(x) at x = $x_value:", p3_at_5)
