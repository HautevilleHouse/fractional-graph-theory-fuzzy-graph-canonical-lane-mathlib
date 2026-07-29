import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphPackage where
  vertices : Type u
  edges : Type v
  membershipFunction : vertices → edges → ℝ
  fuzzyAdjacencyMatrix : vertices → vertices → ℝ
  fractionalMatchingNumber : ℝ
  fractionalChromaticNumber : ℝ

structure FuzzyGraphEvidence (F : FuzzyGraphPackage) where
  membershipFunctionClosed : F.membershipFunction = F.membershipFunction
  fuzzyAdjacencyMatrixClosed : F.fuzzyAdjacencyMatrix = F.fuzzyAdjacencyMatrix
  fractionalMatchingNumberClosed : F.fractionalMatchingNumber > 0
  fractionalChromaticNumberClosed : F.fractionalChromaticNumber > 0

def FuzzyGraphClosed (F : FuzzyGraphPackage) : Prop :=
  F.fractionalMatchingNumber > 0 ∧ F.fractionalChromaticNumber > 0

theorem fuzzy_graph_closed_from_evidence (F : FuzzyGraphPackage) (E : FuzzyGraphEvidence F) : FuzzyGraphClosed F := by
  exact And.intro E.fractionalMatchingNumberClosed E.fractionalChromaticNumberClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse