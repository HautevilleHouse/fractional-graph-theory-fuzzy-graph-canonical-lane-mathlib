import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphAdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse