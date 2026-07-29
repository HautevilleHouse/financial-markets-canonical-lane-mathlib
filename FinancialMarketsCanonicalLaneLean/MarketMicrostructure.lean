import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure MarketMicrostructurePackage where
  orderBook : Type
  bidAskSpread : Prop
  marketImpact : Prop
  liquidity : Prop
  orderFlow : Prop

structure MarketMicrostructureEvidence (M : MarketMicrostructurePackage) where
  bidAskSpreadClosed : M.bidAskSpread
  marketImpactClosed : M.marketImpact
  liquidityClosed : M.liquidity
  orderFlowClosed : M.orderFlow

def MarketMicrostructureClosed (M : MarketMicrostructurePackage) : Prop :=
  M.bidAskSpread ∧ M.marketImpact ∧ M.liquidity ∧ M.orderFlow

theorem market_microstructure_closed_from_evidence (M : MarketMicrostructurePackage)
    (E : MarketMicrostructureEvidence M) : MarketMicrostructureClosed M := by
  exact And.intro E.bidAskSpreadClosed
    (And.intro E.marketImpactClosed
      (And.intro E.liquidityClosed E.orderFlowClosed))

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse