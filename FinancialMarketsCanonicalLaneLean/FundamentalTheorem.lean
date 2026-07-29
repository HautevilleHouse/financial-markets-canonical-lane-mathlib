import FinancialMarketsCanonicalLaneLean.AdmissibleClass

/-!
# Fundamental Theorem of Asset Pricing Package
-/

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure FundamentalTheoremPackage {A : AdmissibleClass} where
  marketComplete : Prop
  riskNeutralMeasureExists : Prop
  arbitrageFree : Prop
  equivalentMartingaleMeasure : Prop
  priceUniqueness : Prop

structure FundamentalTheoremEvidence {A : AdmissibleClass} (F : FundamentalTheoremPackage) where
  marketCompleteClosed : F.marketComplete
  riskNeutralMeasureExistsClosed : F.riskNeutralMeasureExists
  arbitrageFreeClosed : F.arbitrageFree
  equivalentMartingaleMeasureClosed : F.equivalentMartingaleMeasure
  priceUniquenessClosed : F.priceUniqueness

def FundamentalTheoremClosed {A : AdmissibleClass} (F : FundamentalTheoremPackage) : Prop :=
  F.marketComplete ∧ F.riskNeutralMeasureExists ∧
  F.arbitrageFree ∧ F.equivalentMartingaleMeasure ∧ F.priceUniqueness

theorem fundamental_theorem_closed_from_evidence {A : AdmissibleClass}
    (F : FundamentalTheoremPackage) (E : FundamentalTheoremEvidence F) :
    FundamentalTheoremClosed F := by
  exact And.intro E.marketCompleteClosed
    (And.intro E.riskNeutralMeasureExistsClosed
      (And.intro E.arbitrageFreeClosed
        (And.intro F.equivalentMartingaleMeasure E.priceUniquenessClosed)))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse