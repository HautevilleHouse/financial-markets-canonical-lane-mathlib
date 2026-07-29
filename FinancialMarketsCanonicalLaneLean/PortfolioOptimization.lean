import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure PortfolioOptimizationPackage where
  utilityFunction : Type
  wealthProcess : Type
  investmentHorizon : Prop
  dynamicProgramming : Prop
  optimalControl : Prop

structure PortfolioOptimizationEvidence (P : PortfolioOptimizationPackage) where
  utilityFunctionClosed : P.utilityFunction
  wealthProcessClosed : P.wealthProcess
  dynamicProgrammingClosed : P.dynamicProgramming
  optimalControlClosed : P.optimalControl

def PortfolioOptimizationClosed (P : PortfolioOptimizationPackage) : Prop :=
  P.utilityFunction ∧ P.wealthProcess ∧ P.dynamicProgramming ∧ P.optimalControl

theorem portfolio_optimization_closed_from_evidence (P : PortfolioOptimizationPackage)
    (E : PortfolioOptimizationEvidence P) : PortfolioOptimizationClosed P := by
  exact And.intro E.utilityFunctionClosed
    (And.intro E.wealthProcessClosed
      (And.intro E.dynamicProgrammingClosed E.optimalControlClosed))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse