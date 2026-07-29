import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketInstrument where
  name : String
  assetClass : String
  valuationModel : String
  riskFactors : List String
  hedgeEligible : Bool
  valuationModelTerm : valuationModel ≠ ""
  riskFactorsNonempty : riskFactors ≠ []

structure MarketDataFeed where
  source : String
  instrumentsCovered : List MarketInstrument
  priceDataAvailable : Bool
  liquidityScore : Float
  priceDataAvailableTerm : priceDataAvailable

structure AdmittedInstrument (A : AdmissibleClass) where
  instrument : MarketInstrument
  admissibleUnderClass : A.object = instrument.name
  endpointSatisfied : A.endpointSatisfied

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean