import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure AssetPricingPackage where
  stateSpace : Type
  payoffFunction : Type
  discountFactor : Type
  noArbitrage : Prop
  riskNeutralMeasure : Prop
  completeMarket : Prop

structure AssetPricingEvidence (P : AssetPricingPackage) where
  noArbitrageClosed : P.noArbitrage
  riskNeutralMeasureClosed : P.riskNeutralMeasure
  completeMarketClosed : P.completeMarket

def AssetPricingClosed (P : AssetPricingPackage) : Prop :=
  P.noArbitrage ∧ P.riskNeutralMeasure ∧ P.completeMarket

theorem asset_pricing_closed_from_evidence (P : AssetPricingPackage)
    (E : AssetPricingEvidence P) : AssetPricingClosed P := by
  exact And.intro E.noArbitrageClosed
    (And.intro E.riskNeutralMeasureClosed E.completeMarketClosed)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse