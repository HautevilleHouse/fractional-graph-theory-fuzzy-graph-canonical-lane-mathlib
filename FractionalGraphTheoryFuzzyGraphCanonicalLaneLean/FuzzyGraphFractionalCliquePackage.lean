import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphFractionalCliquePackage (F : FuzzyGraphPackage) where
  fractionalCliqueNumber : ℝ
  fuzzyCliquePartition : List (F.vertices → ℝ)
  partitionCoversEdges : Prop
  fractionalCliqueOptimal : Prop

structure FuzzyGraphFractionalCliqueEvidence {F : FuzzyGraphPackage} (C : FuzzyGraphFractionalCliquePackage F) where
  partitionCoversEdgesClosed : C.partitionCoversEdges
  fractionalCliqueOptimalClosed : C.fractionalCliqueOptimal

def FuzzyGraphFractionalCliqueClosed {F : FuzzyGraphPackage} (C : FuzzyGraphFractionalCliquePackage F) : Prop :=
  C.partitionCoversEdges ∧ C.fractionalCliqueOptimal

theorem fuzzy_graph_fractional_clique_closed_from_evidence
    {F : FuzzyGraphPackage} (C : FuzzyGraphFractionalCliquePackage F)
    (E : FuzzyGraphFractionalCliqueEvidence C) : FuzzyGraphFractionalCliqueClosed C := by
  exact And.intro E.partitionCoversEdgesClosed E.fractionalCliqueOptimalClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse