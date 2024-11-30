┌─╴Math
  GCD              ← ⊙◌⍢(⟜◿:)(±,)
  OneOverSqrt      ← ÷ √ :1
  ScalarProduct    ← /+×
  Conjugate        ← ⍜°ℂ¯
  Dagger           ← ⍉Conjugate
  Exp              ← ⁿ:e
  RoundAny         ← ⍜×⁅
  RoundEsa         ← RoundAny 1e6
  SinAndCos        ← ∩RoundEsa ⊃(∿)(∿+η)
  RHCD             ← ÷2(ℂ1 1)  # Right half complex diagonal
  LHCD             ← ÷2(ℂ¯1 1) # Left half complex diagonal
  OvSqTwo          ← ÷√2
  RealPart         ← ◌°ℂ
  ImPart           ← ◌:°ℂ
  Normalize        ← RealPart÷√:⟜(ScalarProduct⟜Conjugate) # this works for ket vectors
  SignToBit        ← ÷2+1±
  MixOrPure        ← =1⊢/+
  KroneckerProduct ← /⊂≡/≡⊂×¤¤: # /⊂≡/≡⊂⍜⊙♭×¤
└─╴
