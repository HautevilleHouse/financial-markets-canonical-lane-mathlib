import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketModelPackage where
  assetUniverse : Type u
  stateSpace : Type v
  probabilityMeasure : Prop
  filtration : Prop
  adaptedPriceProcess : Prop
  numeraire : Type w
  completeness : Prop
  noArbitrage : Prop

structure MarketModelEvidence (M : MarketModelPackage) where
  probabilityMeasureClosed : M.probabilityMeasure
  filtrationClosed : M.filtration
  adaptedPriceProcessClosed : M.adaptedPriceProcess
  numeraireClosed : M.numeraire
  completenessClosed : M.completeness
  noArbitrageClosed : M.noArbitrage

def MarketModelClosed (M : MarketModelPackage) : Prop :=
  M.probabilityMeasure ∧ M.filtration ∧ M.adaptedPriceProcess ∧
  M.numeraire ∧ M.completeness ∧ M.noArbitrage

theorem market_model_closed_from_evidence (M : MarketModelPackage) (E : MarketModelEvidence M) :
    MarketModelClosed M := by
  exact And.intro E.probabilityMeasureClosed
    (And.intro E.filtrationClosed
      (And.intro E.adaptedPriceProcessClosed
        (And.intro E.numeraireClosed
          (And.intro E.completenessClosed E.noArbitrageClosed))))

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean