import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure DerivativeContract where
  underlying : MarketInstrument
  maturity : Float
  strike : Float
  optionType : String -- "call" or "put"
  pricingModel : PricingModel
  maturityPositive : maturity > 0
  strikeNonnegative : strike ≥ 0
  optionTypeValid : optionType = "call" ∨ optionType = "put"

structure BlackScholesEvidence (D : DerivativeContract) where
  volatilitySurface : Float
  riskFreeRate : Float
  impliedVolatilityPositive : volatilitySurface > 0

def BlackScholesClosed (D : DerivativeContract) : Prop :=
  D.pricingModel.pricingMeasure = "risk-neutral"

theorem black_scholes_from_evidence (D : DerivativeContract) (E : BlackScholesEvidence D) : BlackScholesClosed D := by
  exact D.pricingModel.discountFactorPositive

end HautevilleHouse
end FinancialMarketsCanonicalLaneLean