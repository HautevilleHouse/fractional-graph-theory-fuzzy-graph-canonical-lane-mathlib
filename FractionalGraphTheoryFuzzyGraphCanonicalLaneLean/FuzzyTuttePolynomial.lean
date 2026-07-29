import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

structure FuzzyTuttePolynomial (G : FuzzyFractionalGraph) where
  polynomial : ℕ → ℕ → ℝ
  deletionContractionRecurrence : Prop
  baseCaseEmptyGraph : Prop
  multiplicativeRule : Prop
  deletionContractionRecurrenceClosed : deletionContractionRecurrence
  baseCaseEmptyGraphClosed : baseCaseEmptyGraph
  multiplicativeRuleClosed : multiplicativeRule

structure FuzzyTuttePolynomialEvidence (T : FuzzyTuttePolynomial G) where
  deletionContractionRecurrenceClosed : T.deletionContractionRecurrence
  baseCaseEmptyGraphClosed : T.baseCaseEmptyGraph
  multiplicativeRuleClosed : T.multiplicativeRule

def FuzzyTuttePolynomialClosed (T : FuzzyTuttePolynomial G) : Prop :=
  T.deletionContractionRecurrence ∧ T.baseCaseEmptyGraph ∧ T.multiplicativeRule

theorem fuzzy_tutte_polynomial_closed_from_evidence (T : FuzzyTuttePolynomial G) (E : FuzzyTuttePolynomialEvidence T) :
    FuzzyTuttePolynomialClosed T := by
  exact And.intro E.deletionContractionRecurrenceClosed (And.intro E.baseCaseEmptyGraphClosed E.multiplicativeRuleClosed)

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse