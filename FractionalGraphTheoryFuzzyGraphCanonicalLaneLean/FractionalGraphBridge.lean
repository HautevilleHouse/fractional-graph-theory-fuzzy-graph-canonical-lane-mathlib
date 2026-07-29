import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FractionalGraphStructure

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let O : FractionalGraphAdmissibleObject := A.object
  O.dualityHolds

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse