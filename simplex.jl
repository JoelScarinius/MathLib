using JuMP, GLPK

# Define the model
model = Model(GLPK.Optimizer)

# Define the variables
@variable(model, (x[1:2] >= 0))

# Define the constraints

#test
@constraints(model, begin
    4 * x[1] + 1 * x[2] >= 1
    2 * x[1] + 7 * x[2] >= 2
    6 * x[1] + 3 * x[2] >= 3
end)

# Uppgift 10
# @constraint(model, 3 * x[1] + 1 * x[2] + 7 * x[3] <= 72)
# @constraint(model, 2 * x[1] + 1 * x[2] + 6 * x[3] <= 60)

# Uppgift 11
# @constraint(model, 1 / 6 * x[1] + 1 / 4 * x[2] <= 60)
# @constraint(model, 1 / 2 * x[1] + 1 / 4 * x[2] <= 60)
# @constraint(model, 1 / 3 * x[1] + 1 / 2 * x[2] <= 90)

# Uppgift 12
# @constraint(model, 1 * x[1] + 1 * x[2] + 1 * x[3] <= 6)
# @constraint(model, (-1) * x[2] + 1 * x[3] >= 2)

# Uppgift 13
# @constraint(model, 3 * x[1] + 1 * x[2] + 2 * x[3] + 1 * x[4] + 4 * x[5] <= 1200)
# @constraint(model, 1 * x[1] + 5 * x[2] + 2 * x[3] + 1 * x[4] + 2 * x[5] <= 2400)
# @constraint(model, 7 * x[1] + 2 * x[2] + 1 * x[3] + 3 * x[4] + 5 * x[5] <= 1800)

# Inl 4
# Uppgift 1
# @constraint(model, 3500 * x[1] + 5000 * x[2] + 7500 * x[3] + 9000 * x[4] + 30000 * x[5] + 5000 * x[6] >= 350000)
# @constraint(model, 1 * x[1] + 1 * x[2] + 1 * x[3] + 1 * x[4] + 1 * x[5] + 1 * x[6] <= 3)
# @constraint(model, 1 * x[1] + 1 * x[2] >= 6)
# @constraint(model, 1 * x[3] + 1 * x[4] >= 6)
# @constraint(model, 1 * x[5] + 1 * x[6] >= 6)
# @constraint(model, 1 * x[5] + 1 * x[6] <= 9)
# @constraint(model, 1 * x[1] + 1 * x[2] + 1 * x[3] + 1 * x[4] - 1 * x[5] + 1 * x[6] <= 0)
# @constraint(model, 0.5 * (1 * x[1] + 1 * x[2] + 1 * x[3] + 1 * x[4] + 1 * x[5] + 1 * x[6]) <= 1 * x[5])
# @constraint(model, ((-1) * x[1] - 1 * x[2] - 1 * x[3] - 1 * x[4] - 1 * x[6]) >= 1 * x[5])

# Uppgift 2
# @constraint(model, 2 * x[1] + 1 * x[2] >= 18)
# @constraint(model, 1 * x[1] + 2 * x[2] >= 12)
# Dual
# @constraint(model, 2 * x[1] + 1 * x[2] <= 1)
# @constraint(model, 1 * x[1] + 2 * x[2] <= 1)

# Uppgift 3
# @constraint(model, -2 * x[1] + 3 * x[2] - 5 * x[3] <= -30)
# @constraint(model, 4 * x[1] + 2 * x[2] + 3 * x[3] <= 240)
# Dual
# @constraint(model, -2 * x[1] + 4 * x[2] >= 5)
# @constraint(model, 3 * x[1] + 2 * x[2] >= 3)
# @constraint(model, -5 * x[1] + 3 * x[2] >= 6)

# Uppgift 4
# @constraint(model, 1 * x[1] + 1 * x[2] <= 3)
# @constraint(model, -3 * x[1] + 2 * x[2] <= 1)

# Uppgift 5
# @constraint(model, 2 * x[1] - 1 * x[2] + 1 * x[3] + 1 * x[4] >= 45)
# @constraint(model, -1 * x[1] - 5 * x[2] - 3 * x[3] + 7 * x[4] >= -80)
# @constraint(model, 3 * x[1] + 1 * x[2] + 5 * x[3] + 1 * x[4] >= 67)
# @constraint(model, -3 * x[1] - 1 * x[2] - 5 * x[3] - 1 * x[4] >= -67)
# Dual
# @constraint(model, 2 * x[1] - 1 * x[2] + 3 * x[3] <= 11)
# @constraint(model, -1 * x[1] - 5 * x[2] + 1 * x[3] <= 17)
# @constraint(model, 1 * x[1] - 3 * x[2] + 5 * x[3] <= -25)
# @constraint(model, 1 * x[1] + 7 * x[2] + 1 * x[3] <= 12)
# @constraint(model, 2 * x[1] - 1 * x[2] + 3 * x[3] - 1 * x[4] <= 11)
# @constraint(model, -1 * x[1] - 5 * x[2] + 1 * x[3] - 1 * x[4] <= 17)
# @constraint(model, 1 * x[1] - 3 * x[2] + 5 * x[3] - 1 * x[4] <= -25)
# @constraint(model, 1 * x[1] + 7 * x[2] + 1 * x[3] - 1 * x[4] <= 12)

# Bug report
# @constraint(model, 2 * x[1] + 1 * x[2] >= 4)
# @constraint(model, 1 * x[1] + 1 * x[2] >= 1)
# @constraint(model, 2 * x[1] + 1 * x[2] >= 4)
# @constraint(model, 1 * x[1] + 1 * x[2] >= 1)


# Define the objective function

# Uppgift 10
# @objective(model, Max, 4 * x[1] + 1 * x[2] + 11 * x[3])

# Uppgift 11
# @objective(model, Max, 3 * x[1] + 4 * x[2])

# Uppgift 12
# @objective(model, Max, 3 * x[1] + 4 * x[2] + 2 * x[3])

# Uppgift 13
# @objective(model, Max, 3 * x[1] + 1 * x[2] + 2 * x[3] + 5 * x[4] + 4 * x[5])

# Inl 4
# Uppgift 1
# @objective(model, Min, 6000 * x[1] + 9000 * x[2] + 7500 * x[3] + 9000 * x[4] + 45000 * x[5] + 9000 * x[6])

# Uppgift 2
# @objective(model, Min, 1 * x[1] + 1 * x[2])
# Dual
# @objective(model, Max, 18 * x[1] + 12 * x[2])

# Uppgift 3
# @objective(model, Max, 5 * x[1] + 3 * x[2] + 6 * x[3])
# Dual
# @objective(model, Min, -30 * x[1] + 240 * x[2])

# Uppgift 4
# @objective(model, Max, -1 * x[1] + 9 * x[2])

# Uppgift 5
# @objective(model, Min, 11 * x[1] + 17 * x[2] - 25 * x[3] + 12 * x[4])
# Dual
# @objective(model, Max, 45 * x[1] - 80 * x[2] + 67 * x[3])
# @objective(model, Max, 45 * x[1] - 80 * x[2] + 67 * x[3] - 67 * x[4])

@objective(model, Min, 1 * x[1] + 5 * x[2])

# Bug report
# @objective(model, Min, 1 * x[1] - 1 * x[2])

# Solve the problem
optimize!(model)

# Get the optimal solution
optimal_solution = value.(x)

# Get the optimal objective value
optimal_objective_value = objective_value(model)

println("Optimal solution: ", optimal_solution)
println("Optimal objective value: ", optimal_objective_value)

# function simplex(A, b, c)
#     m, n = size(A)
#     B = 1:m
#     N = m+1:m+n
#     xB = b
#     xN = zeros(n)
#     cB = c[B]
#     cN = c[N]
#     while true
#         # Compute the simplex tableau
#         Binv = inv(A[:, B])
#         tableau = [Binv*A[:, N] Binv*b; cN'-cB'*Binv*A[:, N] cB'*Binv*b]
#         println("Simplex tableau:\n", tableau)

#         # Check for optimality
#         if all(tableau[end, 1:end-1] .>= 0)
#             return Dict(zip([B; N], vcat(xB, xN)))
#         end

#         # Choose entering variable
#         enter = argmin(tableau[end, 1:end-1])[2]

#         # Check for unboundedness
#         if all(tableau[1:end-1, enter] .<= 0)
#             error("Problem is unbounded")
#         end

#         # Choose leaving variable
#         ratios = tableau[1:end-1, end] ./ tableau[1:end-1, enter]
#         leave = argmin(ratios[ratios.>0])[1]

#         # Pivot
#         pivot!(tableau, leave, enter)

#         # Update basis
#         B[leave], N[enter] = N[enter], B[leave]
#         xB[leave], xN[enter] = xN[enter], xB[leave]
#         cB[leave], cN[enter] = cN[enter], cB[leave]
#     end
# end

# function pivot!(tableau, leave, enter)
#     tableau[leave, :] ./= tableau[leave, enter]
#     for i in setdiff(1:size(tableau, 1), leave)
#         tableau[i, :] -= tableau[i, enter] * tableau[leave, :]
#     end
# end