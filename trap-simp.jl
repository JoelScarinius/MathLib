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
f(x) = (1 - exp(-x^3)) / x^1.3

# Define the limits of integration
a = 0
b = 1

# Define the number of points for each subdivision
subdivisions = [10, 20, 40, 80]

for n in subdivisions
    # Generate an array of x-values and compute the corresponding y-values
    x = range(a, stop=b, length=n + 1)
    y = f.(x)

    # Compute the step size
    h = norm(x[2:end] - x[1:end-1], Inf)

    # Perform the integration using the trapezoidal rule and Simpson's rule
    T = qTrap(y, h)
    S = qSimp(y, h)

    println("Subdivision: $n")
    println("Trapezoidal rule result: $T")
    println("Simpson's rule result: $S")
    println()
end
