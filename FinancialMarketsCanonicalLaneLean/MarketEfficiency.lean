import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketEfficiencyPackage where
  weakForm : Prop
  semiStrongForm : Prop
  strongForm : Prop
  informationSet : Type
  priceProcess : Type
  filtration : Prop
  martingaleProperty : Prop

structure MarketEfficiencyEvidence (M : MarketEfficiencyPackage) where
  weakFormClosed : M.weakForm
  semiStrongFormClosed : M.semiStrongForm
  strongFormClosed : M.strongForm
  martingalePropertyClosed : M.martingaleProperty

def MarketEfficiencyClosed (M : MarketEfficiencyPackage) : Prop :=
  M.weakForm ∧ M.semiStrongForm ∧ M.strongForm ∧ M.martingaleProperty

theorem market_efficiency_closed_from_evidence (M : MarketEfficiencyPackage)
    (E : MarketEfficiencyEvidence M) : MarketEfficiencyClosed M := by
  exact And.intro E.weakFormClosed
    (And.intro E.semiStrongFormClosed
      (And.intro E.strongFormClosed E.martingalePropertyClosed))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse