module Plots
using Solvers::BDF
export plotit
plotit() = "plot of " * BDF.solve(BDF.BDFAlg())
end
