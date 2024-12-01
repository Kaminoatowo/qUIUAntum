~ "../lib/Mlt.ua" 
~ UnKroneckerProduct!
~ "../lib/Math.ua" 
~ RoundAny OverSqrt
┌─╴UnKroneckerProduct
  Sqrt    ↚ OverSqrt 2
  A       ↚ ↯2_1 Sqrt_Sqrt
  Ket     ← ↯ 4_1 [0.5 0.5 0.5 0.5]
  Try     ← UnKroneckerProduct!1 Ket
  Correct ← ↯ 2_1 (□ A)_(□ A)
  Msg     ← "Testing the decomposition of an equal superposition in every state"
└─╴
┌─╴test
Round = RoundAny 1e15
  ⍤⟜≍: ∩Round UnKroneckerProduct~Correct UnKroneckerProduct~Try
└─╴
