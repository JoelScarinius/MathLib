import numpy as np
import math
from scipy.integrate import quad


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


# Define the integrand for I_0^1
def integrand_0_1(x):
    return (1 - np.exp(-(x**3))) / x**1.3


# Define the integrand for I_1^a
def integrand_1_a(x):
    return (1 - np.exp(-(x**3))) / x**1.3


# Define the integrand for I_a^∞
def integrand_a_inf(x):
    return (1 - np.exp(-(x**3))) / x**1.3


# Compute I_0^1 using series expansion and truncation
I_0_1 = quad(integrand_0_1, 0, 1)[0]

# Compute I_1^a using qTrap and qSimp
yi = np.array([integrand_1_a(x) for x in np.linspace(1, 3, 100)])
h = 0.02  # Step size
I_1_a_trap = qTrap(yi, h)
I_1_a_simp = qSimp(yi, h)

# Compute I_a^∞ using estimation
a = 3  # Choose a so that I_a^∞ < 10^-10
I_a_inf = quad(integrand_a_inf, a, np.inf)[0]

# Print the results
print(f"I_0^1 = {I_0_1}")
print(f"I_1^a (trapezoidal rule) = {I_1_a_trap}")
print(f"I_1^a (Simpson's rule) = {I_1_a_simp}")
print(f"I_a^∞ = {I_a_inf}")
