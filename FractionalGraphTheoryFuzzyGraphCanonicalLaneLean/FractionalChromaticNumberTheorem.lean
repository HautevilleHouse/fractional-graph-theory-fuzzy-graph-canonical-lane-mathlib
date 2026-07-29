import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FractionalChromaticNumberTheoremPackage where
  graph : FractionalGraphPackage
  fuzzy : FuzzyGraphStructure (graph.vertexSet)
  chromaticNumberBound : graph.fractionalChromaticNumber ≤ 2
  fractionalCliqueNumberBound : graph.fractionalCliqueNumber ≥ 1

def FractionalChromaticNumberTheoremClosed
    (P : FractionalChromaticNumberTheoremPackage) : Prop :=
  P.chromaticNumberBound ∧ P.fractionalCliqueNumberBound

theorem fractional_chromatic_number_theorem_closed
    (P : FractionalChromaticNumberTheoremPackage)
    (hchrom : P.chromaticNumberBound) (hcliq : P.fractionalCliqueNumberBound) :
    FractionalChromaticNumberTheoremClosed P := by
  exact And.intro hchrom hcliq

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse