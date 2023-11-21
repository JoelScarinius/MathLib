import numpy as np  # Example Python code:


def qTrap(yi, h):  # Trapez rule quadrature
    T = 0.5 * (yi[0] + yi[-1])  # Endnodes
    T += np.sum(yi[1:-1])  # Innernodes
    return T * h


def qSimp(yi, h):  # Simpson 1/3 rule
    n = len(yi)
    if (n < 3) or (n % 2 == 0):
        print(f"ERROR: #(nodes) should be >=3 and ODD")
        return None

    S = yi[0] + yi[-1]  # Endnodes
    S += 2.0 * np.sum(yi[2:-2:2])  # Interval endnodes
    S += 4.0 * np.sum(yi[1:-1:2])  # Interval midpoints
    return S * h / 3


# Assume you have some y-values and a step size h
yi = np.array([1, 2, 3, 4, 5])
h = 0.5

# Compute the results
T = qTrap(yi, h)
S = qSimp(yi, h)

# Print the results
print(f"The result of the trapezoidal rule is: {T}")
print(f"The result of Simpson's rule is: {S}")
