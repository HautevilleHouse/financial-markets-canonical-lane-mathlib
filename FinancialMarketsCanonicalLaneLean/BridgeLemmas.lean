import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarketWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse