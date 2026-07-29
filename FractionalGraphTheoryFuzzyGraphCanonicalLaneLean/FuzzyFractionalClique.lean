import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalGraphTheoryFuzzyGraphCanonicalLaneLean.FuzzyFractionalGraph

namespace HautevilleHouse
namespace FractionalGraphTheoryFuzzyGraphCanonicalLaneLean

/-!
# Fuzzy Fractional Clique Package

Defines fuzzy fractional cliques and their admissible evidence.
-/

structure FuzzyFractionalClique (V : Type u) (G : FuzzyGraph V) where
  cliqueWeights : V → ℝ
  cliqueCondition : ∀ u v, u ≠ v → cliqueWeights u + cliqueWeights v ≤ G.edgeMembership u v
  positivity : ∀ v, cliqueWeights v ≥ 0

structure FuzzyFractionalCliqueEvidence (V : Type u) (G : FuzzyGraph V) (K : FuzzyFractionalClique V G) where
  cliqueConditionClosed : K.cliqueCondition
  positivityClosed : K.positivity

def FuzzyFractionalCliqueClosed (V : Type u) (G : FuzzyGraph V) (K : FuzzyFractionalClique V G) : Prop :=
  K.cliqueCondition ∧ K.positivity

theorem fuzzy_fractional_clique_closed_from_evidence
  (V : Type u) (G : FuzzyGraph V) (K : FuzzyFractionalClique V G)
  (E : FuzzyFractionalCliqueEvidence V G K) : FuzzyFractionalCliqueClosed V G K := by
  exact And.intro E.cliqueConditionClosed E.positivityClosed

end FractionalGraphTheoryFuzzyGraphCanonicalLaneLean
end HautevilleHouse