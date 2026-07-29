import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FractionalGraphPackage where
  vertexSet : Type u
  edgeWeight : vertexSet → vertexSet → ℝ
  fractionalCliqueNumber : ℝ
  fractionalChromaticNumber : ℝ
  weightConsistent : Prop
  cliqueNumberBound : fractionalCliqueNumber ≤ fractionalChromaticNumber

structure FractionalGraphEvidence (F : FractionalGraphPackage) where
  weightConsistentClosed : F.weightConsistent
  cliqueNumberBoundClosed : F.cliqueNumberBound

def FractionalGraphClosed (F : FractionalGraphPackage) : Prop :=
  F.weightConsistent ∧ F.cliqueNumberBound

theorem fractional_graph_closed_from_evidence
    (F : FractionalGraphPackage) (E : FractionalGraphEvidence F) :
    FractionalGraphClosed F := by
  exact And.intro E.weightConsistentClosed E.cliqueNumberBoundClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse