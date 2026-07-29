import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyGraphWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse