import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketAdmittedObject where
  modelId : String
  calibrationStable : Prop
  residualBound : Prop
  conclusion : residualBound

def MarketWitnessClosed (O : MarketAdmittedObject) : Prop :=
  O.residualBound

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse