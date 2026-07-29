import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FinancialMarketsCanonicalLaneLean.ArbitrageFree

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure OptionPricingModel (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) where
  optionType : Type
  payoff : optionType → α
  price : optionType → α
  blackScholesFormula : Prop
  greeksDefined : Prop

structure OptionPricingEvidence (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) (O : OptionPricingModel α M A) where
  priceConsistent : ∀ k : O.optionType, O.price k = O.payoff k
  blackScholesFormulaClosed : O.blackScholesFormula
  greeksDefinedClosed : O.greeksDefined

def OptionPricingClosed (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) (O : OptionPricingModel α M A) : Prop :=
  (∀ k : O.optionType, O.price k = O.payoff k) ∧ O.blackScholesFormula ∧ O.greeksDefined

theorem option_pricing_closed_from_evidence (α : Type) (M : MarketState α) (A : ArbitrageFreeCondition α M) (O : OptionPricingModel α M A) (E : OptionPricingEvidence α M A O) : OptionPricingClosed α M A O := by
  exact And.intro E.priceConsistent (And.intro E.blackScholesFormulaClosed E.greeksDefinedClosed)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse