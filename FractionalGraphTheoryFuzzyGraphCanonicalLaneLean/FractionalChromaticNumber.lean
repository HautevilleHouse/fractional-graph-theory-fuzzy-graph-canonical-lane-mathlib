import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FractionalColoring (G : FuzzyFractionalGraph) where
  colorSet : Type u
  independentSetWeight : colorSet → ℝ
  coverageCondition : ∀ v : G.vertexSet, ∑ c : colorSet, independentSetWeight c ≥ 1
  totalWeightSum : ∑ c : colorSet, independentSetWeight c = G.totalWeight

structure FractionalChromaticNumberPackage (G : FuzzyFractionalGraph) where
  fractionalChromaticNumber : ℝ
  lowerBound : Prop
  upperBound : Prop
  optimalColoring : Option (FractionalColoring G)
  optimalAchieves : Prop
  lowerBoundClosed : lowerBound
  upperBoundClosed : upperBound
  optimalAchievesClosed : optimalAchieves

structure FractionalChromaticNumberEvidence {G : FuzzyFractionalGraph} (F : FractionalChromaticNumberPackage G) where
  lowerBoundClosed : F.lowerBound
  upperBoundClosed : F.upperBound
  optimalAchievesClosed : F.optimalAchieves

def FractionalChromaticNumberClosed {G : FuzzyFractionalGraph} (F : FractionalChromaticNumberPackage G) : Prop :=
  F.lowerBound ∧ F.upperBound ∧ F.optimalAchieves

theorem fractional_chromatic_number_closed_from_evidence {G : FuzzyFractionalGraph} (F : FractionalChromaticNumberPackage G) (E : FractionalChromaticNumberEvidence F) :
    FractionalChromaticNumberClosed F := by
  exact And.intro E.lowerBoundClosed (And.intro E.upperBoundClosed E.optimalAchievesClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse