import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyPath (G : FuzzyFractionalGraph) where
  vertexSequence : List G.vertexSet
  edgeMembershipDegrees : List ℝ
  pathStrength : ℝ
  pathStrengthPositive : pathStrength > 0

structure FuzzyConnectivityPackage (G : FuzzyFractionalGraph) where
  connectivityValue : ℝ
  maximumPathStrength : Prop
  minimumCutSetStrength : Prop
  maxFlowMinCutEquality : Prop
  maximumPathStrengthClosed : maximumPathStrength
  minimumCutSetStrengthClosed : minimumCutSetStrength
  maxFlowMinCutEqualityClosed : maxFlowMinCutEquality

structure FuzzyConnectivityEvidence {G : FuzzyFractionalGraph} (C : FuzzyConnectivityPackage G) where
  maximumPathStrengthClosed : C.maximumPathStrength
  minimumCutSetStrengthClosed : C.minimumCutSetStrength
  maxFlowMinCutEqualityClosed : C.maxFlowMinCutEquality

def FuzzyConnectivityClosed {G : FuzzyFractionalGraph} (C : FuzzyConnectivityPackage G) : Prop :=
  C.maximumPathStrength ∧ C.minimumCutSetStrength ∧ C.maxFlowMinCutEquality

theorem fuzzy_connectivity_closed_from_evidence {G : FuzzyFractionalGraph} (C : FuzzyConnectivityPackage G) (E : FuzzyConnectivityEvidence C) :
    FuzzyConnectivityClosed C := by
  exact And.intro E.maximumPathStrengthClosed (And.intro E.minimumCutSetStrengthClosed E.maxFlowMinCutEqualityClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse