# Experimental!
---Math
  ScalarProduct ← /+×
  Conjugate ← ⍜°ℂ¯
  Dagger ← ⍉Conjugate
  Normalize ← ÷√:⟜(ScalarProduct⟜Conjugate) # this works for ket vectors
  Exp ← ⁿ:e
  RoundAny ← ⍜×⁅
  RoundEsa ← RoundAny 1e6
  SinAndCos ← ∩RoundEsa ⊃(∿)(∿+η)
  RHCD ← ÷2(ℂ1 1)  # Right half complex diagonal
  LHCD ← ÷2(ℂ¯1 1) # Left half complex diagonal
  OvSqTwo ← ÷√2
  RealPart ← ◌°ℂ
  ImPart ← ◌:°ℂ
  SignToBit ← ÷2+1±
  MixOrPure ← =1⊢/+
  KroneckerProduct ← /⊂≡/≡⊂⍜⊙♭×¤
  # Floating point epsilon
ε ← 2.2204460492503131e-16
  # ? SwappedRows Pivot
GaussEliminate‼ ↚ ∧(
  ⊢⍖⊸⌵⍜⊙↙×0⟜⊡⤚⊸⊙⍉
  ⍜⊏⇌ ⊃⊙⊙∘^0 ⊟⤙⊙⊙∘ ⊙(⊃⋅⊙∘^1 ⍤.≥ε⊸⌵) ⟜⊡
  ⊸⍜⊡(÷⊸⊡:),
  ⍜(°⊂↻|⊙-:⊸⊞×:⊙(⊡⤚˜⊙⍉)),
)°⊏

# Matrix Determinant
MDet ← ◌⍣GaussEliminate‼(⍥¯/≠⊙⋅⋅∘|×⊙⋅⋅∘)⊙0 ⊙1
---
