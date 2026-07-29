import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FinancialMarketsCanonicalLaneLean.MarketModelPackage

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure EquilibriumPricingPackage {M : MarketModelPackage} where
  representativeAgent : Type u
  endowmentProcess : Prop
  equilibriumPrices : Prop
  statePriceDensity : Type v
  riskPremium : Prop
  equityPremiumPuzzle : Prop
  overlappingGenerations : Prop

structure EquilibriumPricingEvidence {M : MarketModelPackage} (E : EquilibriumPricingPackage M) where
  endowmentProcessClosed : E.endowmentProcess
  equilibriumPricesClosed : E.equilibriumPrices
  riskPremiumClosed : E.riskPremium
  overlappingGenerationsClosed : E.overlappingGenerations

def EquilibriumPricingClosed {M : MarketModelPackage} (E : EquilibriumPricingPackage M) : Prop :=
  E.endowmentProcess ∧ E.equilibriumPrices ∧ E.riskPremium ∧ E.overlappingGenerations

theorem equilibrium_pricing_closed_from_evidence {M : MarketModelPackage} (E : EquilibriumPricingPackage M) (Ev : EquilibriumPricingEvidence E) : EquilibriumPricingClosed E := by
  exact And.intro Ev.endowmentProcessClosed
    (And.intro Ev.equilibriumPricesClosed
      (And.intro Ev.riskPremiumClosed Ev.overlappingGenerationsClosed))

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean