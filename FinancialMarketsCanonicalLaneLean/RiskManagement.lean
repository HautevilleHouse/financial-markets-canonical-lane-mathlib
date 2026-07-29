import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure RiskManagementPackage where
  riskMeasure : Type
  var : Prop
  expectedShortfall : Prop
  coherentRisk : Prop
  convexRisk : Prop

structure RiskManagementEvidence (R : RiskManagementPackage) where
  varClosed : R.var
  expectedShortfallClosed : R.expectedShortfall
  coherentRiskClosed : R.coherentRisk
  convexRiskClosed : R.convexRisk

def RiskManagementClosed (R : RiskManagementPackage) : Prop :=
  R.var ∧ R.expectedShortfall ∧ R.coherentRisk ∧ R.convexRisk

theorem risk_management_closed_from_evidence (R : RiskManagementPackage)
    (E : RiskManagementEvidence R) : RiskManagementClosed R := by
  exact And.intro E.varClosed
    (And.intro E.expectedShortfallClosed
      (And.intro E.coherentRiskClosed E.convexRiskClosed))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse