module Recipes
using Heavy, Helper
import Solvers::Common   # a listed sibling: no [subdeps] needed
export recipe
recipe() = Heavy.heavy() * "+" * Helper.helper()
end
