import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

def ConstrainedMarketClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_market_endgame (A : AdmissibleClass) :
    ConstrainedMarketClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse