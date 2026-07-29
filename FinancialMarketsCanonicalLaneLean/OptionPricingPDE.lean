import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FinancialMarketsCanonicalLaneLean.MarketModelPackage

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure OptionPricingPDEPackage {M : MarketModelPackage} (F : M.assetUniverse → Prop) where
  underlyingDynamics : Prop
  payoffFunction : Type u
  pdeCoefficients : Prop
  boundaryConditions : Prop
  solutionExists : Prop
  replicatingStrategy : Prop
  hedgeClosed : Prop

structure OptionPricingPDEEvidence {M : MarketModelPackage} {F : M.assetUniverse → Prop} (O : OptionPricingPDEPackage F) where
  underlyingDynamicsClosed : O.underlyingDynamics
  pdeCoefficientsClosed : O.pdeCoefficients
  boundaryConditionsClosed : O.boundaryConditions
  solutionExistsClosed : O.solutionExists
  replicatingStrategyClosed : O.replicatingStrategy
  hedgeClosedClosed : O.hedgeClosed

def OptionPricingPDEClosed {M : MarketModelPackage} {F : M.assetUniverse → Prop} (O : OptionPricingPDEPackage F) : Prop :=
  O.underlyingDynamics ∧ O.pdeCoefficients ∧ O.boundaryConditions ∧
  O.solutionExists ∧ O.replicatingStrategy ∧ O.hedgeClosed

theorem option_pricing_pde_closed_from_evidence {M : MarketModelPackage} {F : M.assetUniverse → Prop} (O : OptionPricingPDEPackage F) (E : OptionPricingPDEEvidence O) : OptionPricingPDEClosed O := by
  exact And.intro E.underlyingDynamicsClosed
    (And.intro E.pdeCoefficientsClosed
      (And.intro E.boundaryConditionsClosed
        (And.intro E.solutionExistsClosed
          (And.intro E.replicatingStrategyClosed E.hedgeClosedClosed))))

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean