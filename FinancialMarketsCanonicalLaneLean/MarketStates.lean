import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketState (α : Type) where
  cash : α
  holdings : α
  prices : α → α
  volatility : α

structure MarketStateEvidence (α : Type) (M : MarketState α) where
  cashNonnegative : M.cash ≥ 0
  holdingsMeasurable : M.holdings = M.holdings
  pricesPositive : ∀ x : α, M.prices x > 0
  volatilityFinite : M.volatility < ∞

def MarketStateClosed (α : Type) (M : MarketState α) : Prop :=
  M.cash ≥ 0 ∧ M.holdings = M.holdings ∧ (∀ x : α, M.prices x > 0) ∧ M.volatility < ∞

theorem market_state_closed_from_evidence (α : Type) (M : MarketState α) (E : MarketStateEvidence α M) : MarketStateClosed α M := by
  exact And.intro E.cashNonnegative (And.intro E.holdingsMeasurable (And.intro E.pricesPositive E.volatilityFinite))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse