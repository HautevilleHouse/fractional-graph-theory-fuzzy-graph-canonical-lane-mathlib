import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphIsomorphism (G H : FuzzyFractionalGraph) where
  vertexBijection : G.vertexSet ≃ H.vertexSet
  edgeBijection : G.edgeSet ≃ H.edgeSet
  membershipDegreePreserved : ∀ e, H.membershipDegree (edgeBijection e) = G.membershipDegree e
  fractionalWeightPreserved : ∀ e, H.fractionalWeight (edgeBijection e) = G.fractionalWeight e

structure FuzzyGraphAutomorphism (G : FuzzyFractionalGraph) where
  vertexPermutation : G.vertexSet ≃ G.vertexSet
  edgePermutation : G.edgeSet ≃ G.edgeSet
  membershipDegreePreserved : ∀ e, G.membershipDegree (edgePermutation e) = G.membershipDegree e
  fractionalWeightPreserved : ∀ e, G.fractionalWeight (edgePermutation e) = G.fractionalWeight e

def FuzzyGraphIsomorphismDefined (G H : FuzzyFractionalGraph) : Prop :=
  Nonempty (FuzzyGraphIsomorphism G H)

theorem fuzzy_graph_isomorphism_reflexive (G : FuzzyFractionalGraph) :
    FuzzyGraphIsomorphismDefined G G := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact Equiv.refl _
  · exact Equiv.refl _
  · intro e; rfl
  · intro e; rfl

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse