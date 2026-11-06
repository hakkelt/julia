module Recipes
using Heavy, Helper
Base.@subpackage import Solvers::Common   # a listed sibling through @subpackage: no [subdeps] needed
export recipe
recipe() = Heavy.heavy() * "+" * Helper.helper()
end
