import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyAdmissibleObject where
  carrier : Type u
  edgeMembership : carrier → carrier → Prop
  fractionalWeight : carrier → carrier → ℝ
  fuzzyMembership : carrier → ℝ
  completenessCondition : Prop
  conclusion : completenessCondition

structure AdmissibleClass where
  object : FuzzyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse