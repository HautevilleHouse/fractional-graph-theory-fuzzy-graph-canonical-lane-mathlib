import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphAdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FractionalGraphPackage where
  vertexSet : Type u
  edgeFraction : vertexSet → vertexSet → ℝ
  fractionalEdgeInequalities : Prop
  fractionalMatching : Prop
  fractionalColoring : Prop

structure FractionalGraphEvidence (G : FractionalGraphPackage) where
  fractionalEdgeInequalitiesClosed : G.fractionalEdgeInequalities
  fractionalMatchingClosed : G.fractionalMatching
  fractionalColoringClosed : G.fractionalColoring

def FractionalGraphClosed (G : FractionalGraphPackage) : Prop :=
  G.fractionalEdgeInequalities ∧ G.fractionalMatching ∧ G.fractionalColoring

theorem fractional_graph_closed_from_evidence (G : FractionalGraphPackage)
    (E : FractionalGraphEvidence G) : FractionalGraphClosed G :=
  And.intro E.fractionalEdgeInequalitiesClosed
    (And.intro E.fractionalMatchingClosed E.fractionalColoringClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse