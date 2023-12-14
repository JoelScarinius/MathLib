function gauss_jordan(A, b)
    # Augment the matrix A with the vector b
    M = [A b]

    # Perform Gauss-Jordan elimination
    for i in 1:size(M, 1)
        # Find the pivot row
        pivot_row = argmax(abs.(M[i:end, i]))[1] + i - 1

        # Swap the pivot row with the current row
        M[[i, pivot_row], :] = M[[pivot_row, i], :]

        # Normalize the pivot row
        M[i, :] /= M[i, i]

        # Eliminate other rows
        for j in setdiff(1:size(M, 1), i)
            M[j, :] -= M[j, i] * M[i, :]
        end
    end

    # Return the solution vector
    return M[:, end]
end

# Test the function
A = [1 -1 1; 1 0 0; 1 1 1; 1 2 4]
b = [5; 6; -1; 4]
x = gauss_jordan(A, b)
println("Solution: ", x)