module BDF
using Solvers::Common, Heavy       # Heavy is a weakdep listed for BDF
using Solvers             # loading the parent is allowed
import Solvers::Common: solve
export BDFAlg
struct BDFAlg <: Common.AbstractSolver end
solve(::BDFAlg) = "bdf via " * Heavy.heavy() * ", parent loaded: " * string(Solvers.parent_loaded())
try_unlisted() = nothing
end
