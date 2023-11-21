using LinearAlgebra: norm

function qTrap(yi, h)
    # Trapezoidal rule quadrature
    T = 0.5 * (yi[1] + yi[end])  # Endnodes
    T += sum(yi[2:end-1])  # Innernodes
    return T * h
end

function qSimp(yi, h)
    # Simpson 1/3 rule
    n = length(yi)
    if n < 3 || n % 2 == 0
        println("ERROR: #(nodes) should be >= 3 and ODD")
        return nothing
    end

    S = yi[1] + yi[end]  # Endnodes
    S += 2.0 * sum(yi[3:2:end-2])  # Interval endnodes
    S += 4.0 * sum(yi[2:2:end-1])  # Interval midpoints

    return S * h / 3
end

# Define the function you want to integrate
f(x) = cos(x)

# Define the limits of integration and the number of points
a = 0
b = pi / 2
n = 101  # Choose an odd number for Simpson's rule

# Generate an array of x-values and compute the corresponding y-values
x = range(a, stop=b, length=n)
y = f.(x)

# Compute the step size
h = norm(x[2:end] - x[1:end-1], Inf)

# Perform the integration using the trapezoidal rule and Simpson's rule
T = qTrap(y, h)
S = qSimp(y, h)

println("Trapezoidal rule result: $T")
println("Simpson's rule result: $S")

# # Generate an array of x-values using the variable step size
# x = [0; cumsum([pi / (8 * k) for k in 1:4])]

# # Ensure that the last x-value is exactly b
# x[end] = b

# # Compute the corresponding y-values
# y = f.(x)

# # Compute the step sizes
# h = x[2:end] - x[1:end-1]

# # Perform the integration using the trapezoidal rule and Simpson's rule
# # Note: You need to modify qTrap and qSimp to accept an array of step sizes
# T = qTrap(y, h)
# S = qSimp(y, h)

# println("Trapezoidal rule result: $T")
# println("Simpson's rule result: $S")