########################################
# Basic import
import A: b
#---------------------
1   (call JuliaLowering.eval_import true TestMod (inert (. A)) (inert (. b)))
2   latestworld
3   (return core.nothing)

########################################
# Import with paths and `as`
import A.B.C: b, c.d as e
#---------------------
1   (call JuliaLowering.eval_import true TestMod (inert (. A B C)) (inert (. b)) (inert (as (. c d) e)))
2   latestworld
3   (return core.nothing)

########################################
# Import macrocall
import A: B.@mac as @mac2
#---------------------
1   (call JuliaLowering.eval_import true TestMod (inert (. A)) (inert (as (. B @mac) @mac2)))
2   latestworld
3   (return core.nothing)

########################################
# Imports without `from` module need separating with latestworld
import A, B
#---------------------
1   (call JuliaLowering.eval_import true TestMod core.nothing (inert (. A)))
2   latestworld
3   (call JuliaLowering.eval_import true TestMod core.nothing (inert (. B)))
4   latestworld
5   (return core.nothing)

########################################
# Multiple usings need separating with latestworld
using A, B
#---------------------
1   (call JuliaLowering.eval_using TestMod (inert (. A)))
2   latestworld
3   (call JuliaLowering.eval_using TestMod (inert (. B)))
4   latestworld
5   (return core.nothing)

########################################
# Using with paths and `as`
using A.B.C: b, c.d as e
#---------------------
1   (call JuliaLowering.eval_import false TestMod (inert (. A B C)) (inert (. b)) (inert (as (. c d) e)))
2   latestworld
3   (return core.nothing)

########################################
# Subpackages (syntax version 1.15+)
using A::B, C
#---------------------
1   (call JuliaLowering.eval_using TestMod (inert (:: (. A) B)))
2   latestworld
3   (call JuliaLowering.eval_using TestMod (inert (. C)))
4   latestworld
5   (return core.nothing)

########################################
# Subpackage with `as`
import A::B as C
#---------------------
1   (call JuliaLowering.eval_import true TestMod core.nothing (inert (as (:: (. A) B) C)))
2   latestworld
3   (return core.nothing)

########################################
# Subpackage before `:`
using A::B: f, g as h
#---------------------
1   (call JuliaLowering.eval_import false TestMod (inert (:: (. A) B)) (inert (. f)) (inert (as (. g) h)))
2   latestworld
3   (return core.nothing)

########################################
# Error: subpackage after `:`
using A: B::C
#---------------------
LoweringError:
using A: B::C
#       └───┘ ── a subpackage `Parent::Sub` cannot follow `:`

########################################
# Error: Import not at top level
function f()
    import A: b
end
#---------------------
LoweringError:
function f()
    import A: b
#   └─────────┘ ── this syntax is only allowed at top level
end

########################################
# Export
export a, b, c
#---------------------
1   (call JuliaLowering.eval_public TestMod true ["a", "b", "c"])
2   (return %₁)

########################################
# Public
public a, b, c
#---------------------
1   (call JuliaLowering.eval_public TestMod false ["a", "b", "c"])
2   (return %₁)
