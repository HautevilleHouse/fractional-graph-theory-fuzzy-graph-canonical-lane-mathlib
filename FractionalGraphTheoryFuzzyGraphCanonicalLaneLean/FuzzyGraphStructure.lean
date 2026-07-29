import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphStructure (V : Type u) where
  membership : V → ℝ
  adjacency : V → V → ℝ
  membershipNormalized : ∀ v, 0 ≤ membership v ∧ membership v ≤ 1
  adjacencySymmetric : ∀ u v, adjacency u v = adjacency v u
  adjacencyBounded : ∀ u v, 0 ≤ adjacency u v ∧ adjacency u v ≤ 1

structure FuzzyGraphEvidence (V : Type u) (F : FuzzyGraphStructure V) where
  membershipNormalizedClosed : F.membershipNormalized
  adjacencySymmetricClosed : F.adjacencySymmetric
  adjacencyBoundedClosed : F.adjacencyBounded

def FuzzyGraphClosed (V : Type u) (F : FuzzyGraphStructure V) : Prop :=
  F.membershipNormalized ∧ F.adjacencySymmetric ∧ F.adjacencyBounded

theorem fuzzy_graph_closed_from_evidence (V : Type u) (F : FuzzyGraphStructure V)
    (E : FuzzyGraphEvidence V F) : FuzzyGraphClosed V F := by
  exact And.intro E.membershipNormalizedClosed
    (And.intro E.adjacencySymmetricClosed E.adjacencyBoundedClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse