import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FinancialMarketsCanonicalLaneLean

structure DerivativesPackage where
  underlyingAsset : Type
  payoffFunction : Type
  hedgingStrategy : Type
  blackScholesFormula : Prop
  impliedVolatility : Prop
  greeks : Prop

structure DerivativesEvidence (D : DerivativesPackage) where
  blackScholesFormulaClosed : D.blackScholesFormula
  impliedVolatilityClosed : D.impliedVolatility
  greeksClosed : D.greeks

def DerivativesClosed (D : DerivativesPackage) : Prop :=
  D.blackScholesFormula ∧ D.impliedVolatility ∧ D.greeks

theorem derivatives_closed_from_evidence (D : DerivativesPackage)
    (E : DerivativesEvidence D) : DerivativesClosed D := by
  exact And.intro E.blackScholesFormulaClosed
    (And.intro E.impliedVolatilityClosed E.greeksClosed)

end FinancialMarketsCanonicalLaneLean
end HautevilleHouse