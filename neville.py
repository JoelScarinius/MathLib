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


print(neville(5, [0, 1, 2, 3], [0, 1, 8, 27]))
