import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraph where
  vertices : Type u
  edges : vertices → vertices → ℝ
  symmetry : ∀ u v : vertices, edges u v = edges v u
  loopZero : ∀ u : vertices, edges u u = 0

structure FractionalColoring (G : FuzzyGraph) where
  colorWeights : G.vertices → ℝ≥0
  totalWeight : ℝ
  weightCondition : totalWeight = ∑ v, colorWeights v
  adjacentSumCondition : ∀ u v : G.vertices, G.edges u v > 0 → colorWeights u + colorWeights v ≤ 1

structure FractionalMatching (G : FuzzyGraph) where
  edgeSelection : (u v : G.vertices) → ℝ≥0
  totalFlow : ℝ
  flowCondition : totalFlow = ∑ u v, edgeSelection u v
  vertexCondition : ∀ v : G.vertices, ∑ u, edgeSelection u v + ∑ w, edgeSelection v w ≤ 1

structure FractionalGraphAdmissibleObject where
  graph : FuzzyGraph
  fractionalChromaticNumber : ℝ
  fractionalMatchingNumber : ℝ
  dualityHolds : fractionalChromaticNumber = fractionalMatchingNumber
  conclusion : dualityHolds

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse