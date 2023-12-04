using Printf

function wDD(x, yi, x0, qi=[], col=100)

    n = length(x)
    Y = copy(yi)  # Initialize the return array

    lastcol = min(n, col + 1)

    if length(qi) == 0
        di = map(x -> x0 - x, x)
    else
        di = copy(qi)
    end

    M = zeros(Real, n, n)
    M[:, 1] = Y
    for j in 1:lastcol-1
        for i in 1:n-j
            Y[i] = (di[i] * Y[i+1] - di[i+j] * Y[i]) / (di[i] - di[i+j])
            M[:, j+1] = Y
        end
    end
    for j in 1:n
        for i in 1:n+1-j
            print(@sprintf("%5i ", M[j, i]))
        end
        println()
    end
end

x = [0, 1, 2, 3]
y = [0, 1, 8, 27]
x0 = 5

wDD(x, y, x0)
