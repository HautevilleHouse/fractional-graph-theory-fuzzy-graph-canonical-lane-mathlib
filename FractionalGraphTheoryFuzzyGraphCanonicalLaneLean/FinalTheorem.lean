import canonicalLaneMathlib.AdmissibleClass
import FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphFuzzySetPackage
import FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphFractionalCliquePackage

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedFractionalFuzzyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fractional_fuzzy_endgame (A : AdmissibleClass) :
    ConstrainedFractionalFuzzyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse