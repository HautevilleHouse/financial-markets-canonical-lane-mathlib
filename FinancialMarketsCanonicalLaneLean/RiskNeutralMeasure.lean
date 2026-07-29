import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FinancialMarketsCanonicalLaneLean.MarketModelPackage

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure RiskNeutralMeasurePackage {M : MarketModelPackage} (N : M.numeraire) where
  equivalentMartingaleMeasure : Prop
  numeraireDeflatedProcesses : Prop
  radonNikodymDerivative : Type u
  girsanovTheorem : Prop
  completenessUnderRN : Prop

structure RiskNeutralMeasureEvidence {M : MarketModelPackage} {N : M.numeraire} (R : RiskNeutralMeasurePackage N) where
  equivalentMartingaleMeasureClosed : R.equivalentMartingaleMeasure
  numeraireDeflatedProcessesClosed : R.numeraireDeflatedProcesses
  girsanovTheoremClosed : R.girsanovTheorem
  completenessUnderRNClosed : R.completenessUnderRN

def RiskNeutralMeasureClosed {M : MarketModelPackage} {N : M.numeraire} (R : RiskNeutralMeasurePackage N) : Prop :=
  R.equivalentMartingaleMeasure ∧ R.numeraireDeflatedProcesses ∧
  R.girsanovTheorem ∧ R.completenessUnderRN

theorem risk_neutral_measure_closed_from_evidence {M : MarketModelPackage} {N : M.numeraire} (R : RiskNeutralMeasurePackage N) (E : RiskNeutralMeasureEvidence R) : RiskNeutralMeasureClosed R := by
  exact And.intro E.equivalentMartingaleMeasureClosed
    (And.intro E.numeraireDeflatedProcessesClosed
      (And.intro E.girsanovTheoremClosed E.completenessUnderRNClosed))

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean