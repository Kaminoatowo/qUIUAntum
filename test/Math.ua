~ "../Math.ua" ~ Math
---Normalize
  Sqrt ↚ ⁿ 0.5 0.5
  Sqrti ↚ ⁿ 0.5 17
  Round ↚ ∵Math~RoundAny 1e10
  Operator ↚ Round Math~Normalize
  Correct ← Round (ℂ 0 Sqrt)_(ℂ 0 Sqrt)
  Try ← Operator 1_1
  Correcti ← Round (ℂ 0 ÷: 1 Sqrti)_(ℂ 0 ÷: 4 Sqrti)
  Tryi ← Operator 2_8
---
---Dagger
  Operator ↚ Math~Dagger
  Correct ← ↯2_2 (ℂ ¯3 0)_1_(ℂ ¯1 0)_(ℂ 1 2)
  Try ← Operator ↯2_2 (ℂ 3 0)_(ℂ 1 0)_1_(ℂ ¯1 2)
---
---KroneckerProduct
  ~ "../Sng.ua" ~ Sng
  ~ "../Gates.ua" ~ Gates
  Sqrt ↚ ⁿ 0.5 0.5
  Sqrtiv ↚ ÷ ⁿ 0.5 2 1
  Round ↚ ∵Math~RoundAny 1e10
  Operator ↚ Round Math~KroneckerProduct
  Correct ← Round ↯4_4 [0 5 0 10 6 7 12 14 0 15 0 20 18 21 24 28]
  Try ← Operator ↯ 2_2 [0 5 6 7] ↯ 2_2 [1 2 3 4]
  Correcti ← Round ↯ 4_1 [1 0 0 0]
  Tryi ← Operator . Sng~Qground
  Correctii ← Round ↯ 4_1 [Sqrt 0 Sqrt 0]
  Tryii ← Operator Sng~Qground ↯ 2_1 [Sqrt Sqrt]
  Correctiii ← Round ↯ 4_1 [0.5 0.5 0.5 0.5]
  Tryiii ← Operator .↯ 2_1 [Sqrt Sqrt]
  Correctiv ← Round ↯ 8_8 [0 0 Sqrt 0 0 0 Sqrt 0
                           0 0 0 Sqrt 0 0 0 Sqrt
                           Sqrt 0 0 0 Sqrt 0 0 0
                           0 Sqrt 0 0 0 Sqrt 0 0
                           0 0 Sqrt 0 0 0 (¯ Sqrt) 0
                           0 0 0 Sqrt 0 0 0 (¯ Sqrt) Sqrt
                           0 0 0 (¯ Sqrt) 0 0 0 0
                           Sqrt 0 0 0 (¯ Sqrt) 0 0]
  Tryiv ← Round Operator Gates~I Operator Gates~X Gates~H
---
---test
⍤⟜≍: Dagger~Correct Dagger~Try
⍤⟜≍: Normalize~Correct Normalize~Try
⍤⟜≍: Normalize~Correcti Normalize~Tryi
⍤⟜≍: KroneckerProduct~Correct KroneckerProduct~Try
⍤⟜≍: KroneckerProduct~Correcti KroneckerProduct~Tryi
⍤⟜≍: KroneckerProduct~Correctii KroneckerProduct~Tryii
⍤⟜≍: KroneckerProduct~Correctiii KroneckerProduct~Tryiii
⍤⟜≍: KroneckerProduct~Correctiv KroneckerProduct~Tryiv
---
