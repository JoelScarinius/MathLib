using JuMP, GLPK

# Define the model
model = Model(GLPK.Optimizer)

# Define the variables
@variable(model, x[1:5] >= 0)

# Define the constraints
# @constraint(model, 1 / 6 * x[1] + 1 / 4 * x[2] <= 60)
# @constraint(model, 1 / 2 * x[1] + 1 / 4 * x[2] <= 60)
# @constraint(model, 1 / 3 * x[1] + 1 / 2 * x[2] <= 90)
# @constraint(model, 1 * x[1] + 1 * x[2] + 1 * x[3] <= 6)
# @constraint(model, (-1) * x[2] + 1 * x[3] >= 2)
# @constraint(model, 3 * x[1] + 1 * x[2] + 7 * x[3] <= 72)
# @constraint(model, 2 * x[1] + 1 * x[2] + 6 * x[3] <= 60)

# Uppgift 13
@constraint(model, 3 * x[1] + 1 * x[2] + 2 * x[3] + 1 * x[4] + 4 * x[5] <= 1200)
@constraint(model, 1 * x[1] + 5 * x[2] + 2 * x[3] + 1 * x[4] + 2 * x[5] <= 2400)
@constraint(model, 7 * x[1] + 2 * x[2] + 1 * x[3] + 3 * x[4] + 5 * x[5] <= 1800)

# Define the objective function
# @objective(model, Max, 4 * x[1] + 1 * x[2] + 11 * x[3])
# @objective(model, Max, 3 * x[1] + 4 * x[2])
# @objective(model, Max, 3 * x[1] + 4 * x[2] + 2 * x[3])

# Uppgift 13
@objective(model, Max, 3 * x[1] + 1 * x[2] + 2 * x[3] + 5 * x[4] + 4 * x[5])

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