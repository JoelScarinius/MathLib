# def wDD(di, yi, col=100):
#     n = len(di)
#     lastcol = min(n, col + 1)
#     Y = [yi[i] for i in range(n)]  # Init return array
#     for j in range(1, lastcol):
#         for i in range(n - j):
#             Y[i] = (di[i] * Y[i + 1] - di[i + j] * Y[i]) / (di[i] - di[i + j])
#     if lastcol < n:
#         return Y[: n - lastcol + 1]
#     else:
#         return Y[0]  # Return a scalar, not a list


# print(wDD([1, 2, 3, 4], [1, 8, 27, 64], 3))
# print(wDD([5, 6, 7, 8], [125, 216, 343, 512], 3))
# print(wDD([0,1,2,3],[0,1,8,27],3))
# print(wDD([0.5,0.25,0.125,0.0625],[1,0.5,0.25,0.125],3))


def wDD(di, yi, col=100):
    n = len(di)
    lastcol = min(n, col + 1)
    Y = [yi[i] for i in range(n)]  # Init return array
    for j in range(1, lastcol):
        for i in range(n - j):
            Y[i] = (di[i] * Y[i + 1] - di[i + j] * Y[i]) / (di[i] - di[i + j])
    if lastcol < n:
        return Y[: n - lastcol + 1]
    else:
        return Y[0]  # Return a scalar, not a list


# Define the x-values and y-values
x = [1, 2, 3, 4]
y = [1**3, 2**3, 3**3, 4**3]

# Compute the weighted divided differences
wdd = wDD(x, y)

# Print the result
print(wdd)


def neville(x, X, Y):
    n = len(X)
    Q = [[0 for _ in range(n)] for _ in range(n)]
    for i in range(n):
        Q[i][0] = Y[i]
    for i in range(1, n):
        for j in range(1, i + 1):
            Q[i][j] = ((x - X[i - j]) * Q[i][j - 1] - (x - X[i]) * Q[i - 1][j - 1]) / (
                X[i] - X[i - j]
            )
    return Q[n - 1][n - 1]


print(neville(2.5, [1, 2, 3, 4], [1, 8, 27, 64]))
