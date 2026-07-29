import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FuzzyGraphAdmissibleObject where
  fuzzyGraph : FuzzyFractionalGraph
  chromaticClosed : FractionalChromaticNumberClosed (somePackage : FractionalChromaticNumberPackage fuzzyGraph)
  connectivityClosed : FuzzyConnectivityClosed (somePackage : FuzzyConnectivityPackage fuzzyGraph)

structure AdmissibleClass where
  object : FuzzyGraphAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (FuzzyFractionalGraphClosed A.object.fuzzyGraph) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse