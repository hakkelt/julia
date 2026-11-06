module SyntaxApp
using Solvers::Tsit5
import Solvers::Common as C
run() = Tsit5.solve(Tsit5Alg())
common_name() = nameof(C)
end
