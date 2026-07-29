import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FractionalGraphStructure

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse