import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure FinancialAdmittedObject where
  marketState : Type
  equilibriumCondition : Prop
  conclusion : equilibriumCondition

def FinancialWitnessClosed (O : FinancialAdmittedObject) : Prop :=
  O.equilibriumCondition

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse
