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


# print(wDD([1,2,3,4],[1,8,27,64],3))
# print(wDD([0,1,2,3],[0,1,8,27],3))
# print(wDD([0.5,0.25,0.125,0.0625],[1,0.5,0.25,0.125],3))
