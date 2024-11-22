┌─╴Math
  ScalarProduct    ← /+×
  Conjugate        ← ⍜°ℂ¯
  Dagger           ← ⍉Conjugate
  Normalize        ← ÷√:⟜(ScalarProduct⟜Conjugate) # this works for ket vectors
  Exp              ← ⁿ:e
  RoundAny         ← ⍜×⁅
  RoundEsa         ← RoundAny 1e6
  SinAndCos        ← ∩RoundEsa ⊃(∿)(∿+η)
  RHCD             ← ÷2(ℂ1 1)  # Right half complex diagonal
  LHCD             ← ÷2(ℂ¯1 1) # Left half complex diagonal
  OvSqTwo          ← ÷√2
  RealPart         ← ◌°ℂ
  ImPart           ← ◌:°ℂ
  SignToBit        ← ÷2+1±
  MixOrPure        ← =1⊢/+
  KroneckerProduct ← /⊂≡/≡⊂×¤¤: # /⊂≡/≡⊂⍜⊙♭×¤
└─╴
