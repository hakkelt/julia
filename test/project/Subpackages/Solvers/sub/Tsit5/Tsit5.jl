module Tsit5
using Common              # sibling subpackage, listed
using Light               # a [deps] entry of the parent: always allowed
import Common: solve
export Tsit5Alg
struct Tsit5Alg <: Common.AbstractSolver end
solve(::Tsit5Alg) = "tsit5 via " * Light.light()
end
