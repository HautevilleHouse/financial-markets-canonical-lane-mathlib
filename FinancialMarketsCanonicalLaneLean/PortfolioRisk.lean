import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure Portfolio where
  holdings : List MarketInstrument
  weights : List Float
  weightsSumOne : List.sum weights = 1
  holdingsNonempty : holdings ≠ []

structure RiskModel where
  covarianceMatrix : List (List Float)
  varLevel : Float
  expectedShortfall : Float
  varPositive : varLevel > 0
  expectedShortfallNonnegative : expectedShortfall ≥ 0

def PortfolioRiskClosed (P : Portfolio) (R : RiskModel) : Prop :=
  R.varLevel ≤ 0.05

theorem portfolio_risk_from_var (P : Portfolio) (R : RiskModel) (h : R.varLevel ≤ 0.05) : PortfolioRiskClosed P R := by
  exact h

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean