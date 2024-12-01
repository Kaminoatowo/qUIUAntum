~ "../lib/Math.ua" 
~ Dagger
~ Normalize
~ KroneckerProduct
~ RoundAny
┌─╴Dagger
  Operator ↚ Dagger
  Correct  ← ↯2_2 (ℂ ¯3 0)_1_(ℂ¯1 0)_(ℂ1 2)
  Try      ← Operator ↯2_2 (ℂ3 0)_(ℂ1 0)_1_(ℂ¯1 2)
└─╴
┌─╴Normalize
  Sqrt     ↚ ⁿ 0.5 0.5
  Sqrti    ↚ ⁿ 0.5 17
  Operator ↚ Normalize
  Correct  ← (Sqrt)_(Sqrt)
  Try      ← Operator 1_1
  Correcti ← (÷: 1 Sqrti)_( ÷: 4 Sqrti)
  Tryi     ← Operator 2_8
└─╴
┌─╴KroneckerProduct
  ~ "../lib/Sng.ua" 
  ~ Qground
  ~ "../lib/Gates.ua" 
  ~ I X H
  Sqrt       ↚ ⁿ 0.5 0.5
  Sqrtiv     ↚ ÷ ⁿ 0.5 2 1
  Operator   ↚ + 0 KroneckerProduct
  Correct    ← ↯4_4 [0 5 0 10 6 7 12 14 0 15 0 20 18 21 24 28]
  Try        ← Operator ↯ 2_2 [1 2 3 4] ↯ 2_2 [0 5 6 7]
  Correcti   ← ↯ 4_1 [1 0 0 0]
  Tryi       ← Operator . Qground
  Correctii  ← ↯ 4_1 [Sqrt 0 Sqrt 0]
  Tryii      ← Operator ↯ 2_1 [Sqrt Sqrt] Qground
  Correctiii ← ↯ 4_1 [0.5 0.5 0.5 0.5]
  Tryiii     ← Operator .↯ 2_1 [Sqrt Sqrt]
  Correctiv ← ↯ 8_8 [
    0 0 Sqrt 0 0 0 Sqrt 0
    0 0 0 Sqrt 0 0 0 Sqrt
    Sqrt 0 0 0 Sqrt 0 0 0
    0 Sqrt 0 0 0 Sqrt 0 0
    0 0 Sqrt 0 0 0 (¯ Sqrt) 0
    0 0 0 Sqrt 0 0 0 (¯ Sqrt) Sqrt
    0 0 0 (¯ Sqrt) 0 0 0 0
    Sqrt 0 0 0 (¯ Sqrt) 0 0]
  Tryiv ← Operator Operator H X I
└─╴
┌─╴test
Round ← ∵RoundAny 1e10
  ⍤⟜≍: ∩Round Dagger~Correct Dagger~Try
  ⍤⟜≍: bothRound Normalize~Correct Normalize~Try
  ⍤⟜≍: ∩Round Normalize~Correcti Normalize~Tryi
  ⍤⟜≍: ∩Round KroneckerProduct~Correct KroneckerProduct~Try
  ⍤⟜≍: ∩Round KroneckerProduct~Correcti KroneckerProduct~Tryi
  ⍤⟜≍: ∩Round KroneckerProduct~Correctii KroneckerProduct~Tryii
  ⍤⟜≍: ∩Round KroneckerProduct~Correctiii KroneckerProduct~Tryiii
  ⍤⟜≍: ∩Round KroneckerProduct~Correctiv KroneckerProduct~Tryiv
└─╴
