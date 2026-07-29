import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure BehavioralFinancePackage where
  investorSentiment : Type
  overconfidence : Prop
  lossAversion : Prop
  herdBehavior : Prop
  marketAnomalies : Prop

structure BehavioralFinanceEvidence (B : BehavioralFinancePackage) where
  overconfidenceClosed : B.overconfidence
  lossAversionClosed : B.lossAversion
  herdBehaviorClosed : B.herdBehavior
  marketAnomaliesClosed : B.marketAnomalies

def BehavioralFinanceClosed (B : BehavioralFinancePackage) : Prop :=
  B.overconfidence ∧ B.lossAversion ∧ B.herdBehavior ∧ B.marketAnomalies

theorem behavioral_finance_closed_from_evidence (B : BehavioralFinancePackage)
    (E : BehavioralFinanceEvidence B) : BehavioralFinanceClosed B := by
  exact And.intro E.overconfidenceClosed
    (And.intro E.lossAversionClosed
      (And.intro E.herdBehaviorClosed E.marketAnomaliesClosed))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse