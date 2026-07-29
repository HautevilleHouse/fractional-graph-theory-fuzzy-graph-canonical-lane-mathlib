import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

/-!
# Fuzzy Fractional Stability Package

Defines fuzzy fractional stable sets and their admissible evidence.
-/

structure FuzzyFractionalStableSet (V : Type u) (G : FuzzyGraph V) where
  stableWeights : V → ℝ
  stabilityConstraint : ∀ u v, G.edgeMembership u v > 0 → stableWeights u + stableWeights v ≤ 1
  positivity : ∀ v, stableWeights v ≥ 0

structure FuzzyFractionalStableSetEvidence (V : Type u) (G : FuzzyGraph V) (S : FuzzyFractionalStableSet V G) where
  stabilityConstraintClosed : S.stabilityConstraint
  positivityClosed : S.positivity

def FuzzyFractionalStableSetClosed (V : Type u) (G : FuzzyGraph V) (S : FuzzyFractionalStableSet V G) : Prop :=
  S.stabilityConstraint ∧ S.positivity

theorem fuzzy_fractional_stable_set_closed_from_evidence
  (V : Type u) (G : FuzzyGraph V) (S : FuzzyFractionalStableSet V G)
  (E : FuzzyFractionalStableSetEvidence V G S) : FuzzyFractionalStableSetClosed V G S := by
  exact And.intro E.stabilityConstraintClosed E.positivityClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse