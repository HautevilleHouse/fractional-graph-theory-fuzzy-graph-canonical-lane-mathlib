import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphCore

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyGraphSpace where
  carrier : Type u
  fuzzyMembership : carrier → ℝ

structure FuzzyAdmittedObject where
  space : FuzzyGraphSpace
  fuzzyGraphComplete : Prop
  fractionalColoringValid : Prop
  fuzzyMatchingValid : Prop
  statement : Prop
  conclusion : statement

structure FuzzyEndgameState where
  object : FuzzyAdmittedObject

def FuzzyWitnessClosed (O : FuzzyAdmittedObject) : Prop :=
  O.statement

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse