module Plots
using BDF
export plotit
plotit() = "plot of " * BDF.solve(BDF.BDFAlg())
end
