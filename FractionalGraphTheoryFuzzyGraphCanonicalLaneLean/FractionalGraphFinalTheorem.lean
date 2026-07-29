import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyGraphGateLemmas

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

def ConstrainedFractionalGraphClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fractional_graph_endgame (A : AdmissibleClass) :
    ConstrainedFractionalGraphClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse