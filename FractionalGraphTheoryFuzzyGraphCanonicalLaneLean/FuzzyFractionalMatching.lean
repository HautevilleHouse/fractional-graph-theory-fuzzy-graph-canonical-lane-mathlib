import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

/-!
# Fuzzy Fractional Matching Package

Defines fuzzy fractional matchings and their admissible evidence.
-/

structure FuzzyFractionalMatching (V : Type u) (G : FuzzyGraph V) where
  matchingWeights : V → V → ℝ
  symmetric : ∀ u v, matchingWeights u v = matchingWeights v u
  vertexConstraint : ∀ v, (∑' u, matchingWeights v u) ≤ G.vertexMembership v
  edgeConstraint : ∀ u v, matchingWeights u v ≤ G.edgeMembership u v

structure FuzzyFractionalMatchingEvidence (V : Type u) (G : FuzzyGraph V) (M : FuzzyFractionalMatching V G) where
  symmetricClosed : M.symmetric
  vertexConstraintClosed : M.vertexConstraint
  edgeConstraintClosed : M.edgeConstraint

def FuzzyFractionalMatchingClosed (V : Type u) (G : FuzzyGraph V) (M : FuzzyFractionalMatching V G) : Prop :=
  M.symmetric ∧ M.vertexConstraint ∧ M.edgeConstraint

theorem fuzzy_fractional_matching_closed_from_evidence
  (V : Type u) (G : FuzzyGraph V) (M : FuzzyFractionalMatching V G)
  (E : FuzzyFractionalMatchingEvidence V G M) : FuzzyFractionalMatchingClosed V G M := by
  exact And.intro E.symmetricClosed (And.intro E.vertexConstraintClosed E.edgeConstraintClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse