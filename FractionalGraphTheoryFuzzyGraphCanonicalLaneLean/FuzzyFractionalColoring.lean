import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

/-!
# Fuzzy Fractional Coloring Package

Defines fuzzy fractional colorings and their admissible evidence.
-/

structure FuzzyFractionalColoring (V : Type u) (α : Type v) [AddCommMonoid α] [SMul ℝ α] (G : FuzzyGraph V) where
  colorWeights : V → α
  independenceConstraint : ∀ u v, G.edgeMembership u v > 0 → colorWeights u + colorWeights v ≤ 1
  weightBound : ∀ v, colorWeights v ≤ (G.vertexMembership v : α)

structure FuzzyFractionalColoringEvidence (V : Type u) (α : Type v) [AddCommMonoid α] [SMul ℝ α]
  (G : FuzzyGraph V) (C : FuzzyFractionalColoring V α G) where
  independenceConstraintClosed : C.independenceConstraint
  weightBoundClosed : C.weightBound

def FuzzyFractionalColoringClosed (V : Type u) (α : Type v) [AddCommMonoid α] [SMul ℝ α]
  (G : FuzzyGraph V) (C : FuzzyFractionalColoring V α G) : Prop :=
  C.independenceConstraint ∧ C.weightBound

theorem fuzzy_fractional_coloring_closed_from_evidence
  (V : Type u) (α : Type v) [AddCommMonoid α] [SMul ℝ α] (G : FuzzyGraph V)
  (C : FuzzyFractionalColoring V α G) (E : FuzzyFractionalColoringEvidence V α G C) :
  FuzzyFractionalColoringClosed V α G C := by
  exact And.intro E.independenceConstraintClosed E.weightBoundClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse