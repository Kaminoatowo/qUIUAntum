~ "../lib/Mlt.ua" ~ Mlt
~ "../lib/Math.ua" ~ Math
┌─╴UnKroneckerProduct
  Sqrt    ↚ ⁿ ÷ 2 1 ÷ 2 1
  A       ↚ ↯2_1 Sqrt_Sqrt
  Ket     ← ↯ 4_1 [0.5 0.5 0.5 0.5]
  Try     ← Mlt~UnKroneckerProduct!1 Ket
  Correct ← ↯ 2_1 (□ A)_(□ A)
  Msg     ← "Testing the decomposition of an equal superposition in every state"
└─╴
┌─╴test
  ⍤⟜≍: ∩(Math~RoundAny 1e15) UnKroneckerProduct~Correct UnKroneckerProduct~Try
└─╴
