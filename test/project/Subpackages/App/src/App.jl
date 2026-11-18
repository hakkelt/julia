module App
using Solvers::Tsit5
run() = Tsit5.solve(Tsit5Alg())
end
