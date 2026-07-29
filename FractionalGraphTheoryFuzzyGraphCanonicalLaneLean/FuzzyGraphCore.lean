import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FractionalGraphCore

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphPackage where
  membershipDegree : Type u → ℝ
  tNorm : ℝ → ℝ → ℝ
  sNorm : ℝ → ℝ → ℝ
  fuzzyEdgeWeights : Prop
  fuzzyConnectivity : Prop
  fuzzyClustering : Prop

structure FuzzyGraphEvidence (F : FuzzyGraphPackage) where
  fuzzyEdgeWeightsClosed : F.fuzzyEdgeWeights
  fuzzyConnectivityClosed : F.fuzzyConnectivity
  fuzzyClusteringClosed : F.fuzzyClustering

def FuzzyGraphClosed (F : FuzzyGraphPackage) : Prop :=
  F.fuzzyEdgeWeights ∧ F.fuzzyConnectivity ∧ F.fuzzyClustering

theorem fuzzy_graph_closed_from_evidence (F : FuzzyGraphPackage)
    (E : FuzzyGraphEvidence F) : FuzzyGraphClosed F :=
  And.intro E.fuzzyEdgeWeightsClosed
    (And.intro E.fuzzyConnectivityClosed E.fuzzyClusteringClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse