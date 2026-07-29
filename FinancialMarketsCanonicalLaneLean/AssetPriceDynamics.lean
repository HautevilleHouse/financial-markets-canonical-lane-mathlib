import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure AssetPricePackage where
  driftRate : ℝ
  volatility : ℝ
  riskFreeRate : ℝ
  dividendYield : ℝ
  initialPrice : ℝ
  martingaleCondition : Prop
  noArbitrageCondition : Prop
  calibrationStable : Prop
  martingaleConditionClosed : martingaleCondition
  noArbitrageConditionClosed : noArbitrageCondition
  calibrationStableClosed : calibrationStable

structure AssetPriceEvidence (F : AssetPricePackage) where
  martingaleConditionClosed : F.martingaleCondition
  noArbitrageConditionClosed : F.noArbitrageCondition
  calibrationStableClosed : F.calibrationStable

def AssetPriceClosed (F : AssetPricePackage) : Prop :=
  F.martingaleCondition ∧ F.noArbitrageCondition ∧ F.calibrationStable

theorem asset_price_closed_from_evidence (F : AssetPricePackage) (E : AssetPriceEvidence F) :
    AssetPriceClosed F := by
  exact And.intro E.martingaleConditionClosed (And.intro E.noArbitrageConditionClosed E.calibrationStableClosed)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse