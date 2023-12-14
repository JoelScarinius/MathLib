import numpy as np


def pivot_on(tableau, row, col):
    # Get the pivot element
    pivot = tableau[row, col]
    # Divide all elements in the pivot row by the pivot element
    tableau[row, :] /= pivot
    # Subtract multiples of the pivot row from all the other rows
    for i in range(tableau.shape[0]):
        if i != row:
            tableau[i, :] -= tableau[i, col] * tableau[row, :]


def simplex(tableau):
    # While there are negative elements in the last row
    while np.any(tableau[-1, :-1] < 0):
        # Choose pivot column (most negative element in the last row)
        col = np.argmin(tableau[-1, :-1])
        # Choose pivot row
        # (smallest positive ratio of RHS to the pivot column element)
        ratios = tableau[:-1, -1] / tableau[:-1, col]
        row = np.argwhere(ratios == np.min(ratios[ratios > 0])).flatten()[0]
        # Perform the pivot
        pivot_on(tableau, row, col)
        # Print the current tableau
        print("Current Tableau:")
        print(tableau)


# Example tableau (you will need to set up your own tableau for your problem)
# The last row is the objective function coefficients with the last element as 0
example_tableau = np.array(
    [
        [3, 2, 1, 12],
        [3, 2, 3, 18],
        [2, 2, 1, 6],
        [0, 2, 3, 10],
        [-4, -5, -6, 0],
    ],
    dtype=float,
)

simplex(example_tableau)
