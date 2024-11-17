~ "../lib/Math.ua" ~ Math
~ "../lib/Sng.ua" ~ Sng
---Bloch
  Round ↚ ∵Math~RoundAny 1e10
  Correct ← ℂ 0 0
  Operator ← ⊢ Round Math~ScalarProduct
  Try ← Round Sng~Bloch π 0 Round Sng~Bloch 0 0
  Msg ← "Cross product of 2 opposing vectors should be 0"
---
---Qsuper
  Sqrt ↚ ℂ 0 ⁿ 0.5 0.5
  Sqrti ↚ ℂ 0 ⁿ 0.5 82
  Round ↚ ∵Math~RoundAny 1e15
  Operator ← ⊢ Round Math~ScalarProduct
  Correct ← ℂ 0 0
  Try ← Round Sng~Qsuper 1 0 Round Sng~Qsuper 0 1
  Msg ← "If the basis is orthogonal, the result should be 0"
  Operatori ←
  Correcti ← Round ↯ 2_1 [Sqrt Sqrt]
  Tryi ← Round Sng~Qsuper 5 5
  Msgi ← "A vector state with equal numbers should give you the state 1/sqrt(2) 1/sqrt(2)"
  Correctii ← Round ↯ 2_1 [÷ Sqrti 1 ÷ Sqrti 9]
  Tryii ← Round Sng~Qsuper 1 9
  Msgii ← "A vector state with different numbers should give you the state 1/sqrt(10) 3/sqrt(10)"
---
---test
# Bloch states orthogonality
⍤⟜≍: Bloch~Correct Bloch~Operator Bloch~Try
# Superposition states orthogonality
⍤⟜≍: Qsuper~Correct Qsuper~Operator Qsuper~Try
# Superposition state with same amplitudes
⍤⟜≍: Qsuper~Correcti Qsuper~Tryi
# Superposition state with different amplitudes
⍤⟜≍: Qsuper~Correctii Qsuper~Tryii
---
