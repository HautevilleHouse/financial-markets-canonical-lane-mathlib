import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FinancialMarketsCanonicalLaneLean.MarketStates

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure ArbitrageFreeCondition (α : Type) (M : MarketState α) where
  noArbitrage : Prop
  riskNeutralMeasure : Type
  martingaleProperty : Prop
  priceUniqueness : Prop

structure ArbitrageFreeEvidence (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) where
  noArbitrageClosed : A.noArbitrage
  martingalePropertyClosed : A.martingaleProperty
  priceUniquenessClosed : A.priceUniqueness

def ArbitrageFreeClosed (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) : Prop :=
  A.noArbitrage ∧ A.martingaleProperty ∧ A.priceUniqueness

theorem arbitrage_free_closed_from_evidence (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) (E : ArbitrageFreeEvidence α M A) : ArbitrageFreeClosed α M A := by
  exact And.intro E.noArbitrageClosed (And.intro E.martingalePropertyClosed E.priceUniquenessClosed)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse