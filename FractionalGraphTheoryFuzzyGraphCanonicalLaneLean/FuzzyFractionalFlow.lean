import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

/-!
# Fuzzy Fractional Flow Package

Defines fuzzy fractional flows in a fuzzy graph.
-/

structure FuzzyFractionalFlow (V : Type u) (G : FuzzyGraph V) (s t : V) where
  flowValue : V → V → ℝ
  capacityConstraint : ∀ u v, flowValue u v ≤ G.edgeMembership u v
  conservation : ∀ v, v ≠ s → v ≠ t → (∑' u, flowValue u v) = (∑' u, flowValue v u)
  netFlowOut : (∑' u, flowValue s u) - (∑' u, flowValue u s) = (∑' u, flowValue u t) - (∑' u, flowValue t u)

structure FuzzyFractionalFlowEvidence (V : Type u) (G : FuzzyGraph V) (s t : V)
  (F : FuzzyFractionalFlow V G s t) where
  capacityConstraintClosed : F.capacityConstraint
  conservationClosed : F.conservation
  netFlowOutClosed : F.netFlowOut

def FuzzyFractionalFlowClosed (V : Type u) (G : FuzzyGraph V) (s t : V)
  (F : FuzzyFractionalFlow V G s t) : Prop :=
  F.capacityConstraint ∧ F.conservation ∧ F.netFlowOut

theorem fuzzy_fractional_flow_closed_from_evidence
  (V : Type u) (G : FuzzyGraph V) (s t : V) (F : FuzzyFractionalFlow V G s t)
  (E : FuzzyFractionalFlowEvidence V G s t F) : FuzzyFractionalFlowClosed V G s t F := by
  exact And.intro E.capacityConstraintClosed (And.intro E.conservationClosed E.netFlowOutClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse