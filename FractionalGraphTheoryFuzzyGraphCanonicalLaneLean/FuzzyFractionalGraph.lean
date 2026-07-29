import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyFractionalGraph where
  vertexSet : Type u
  edgeSet : Type v
  membershipDegree : edgeSet → ℝ
  membershipDegreeRange : ∀ e, 0 ≤ membershipDegree e ∧ membershipDegree e ≤ 1
  fractionalWeight : edgeSet → ℝ
  fractionalWeightNonneg : ∀ e, 0 ≤ fractionalWeight e
  totalWeight : ℝ
  totalWeightPos : totalWeight > 0

structure FuzzyFractionalGraphEvidence (G : FuzzyFractionalGraph) where
  membershipDegreeRangeClosed : ∀ e, 0 ≤ G.membershipDegree e ∧ G.membershipDegree e ≤ 1
  fractionalWeightNonnegClosed : ∀ e, 0 ≤ G.fractionalWeight e
  totalWeightPosClosed : G.totalWeight > 0

def FuzzyFractionalGraphClosed (G : FuzzyFractionalGraph) : Prop :=
  (∀ e, 0 ≤ G.membershipDegree e ∧ G.membershipDegree e ≤ 1) ∧
  (∀ e, 0 ≤ G.fractionalWeight e) ∧
  G.totalWeight > 0

theorem fuzzy_fractional_graph_closed_from_evidence (G : FuzzyFractionalGraph) (E : FuzzyFractionalGraphEvidence G) :
    FuzzyFractionalGraphClosed G := by
  exact And.intro E.membershipDegreeRangeClosed (And.intro E.fractionalWeightNonnegClosed E.totalWeightPosClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse