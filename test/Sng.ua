~ "../lib/Math.ua" ~ Math
~ "../lib/Sng.ua" ~ Sng
---Bloch
  Correct ← 0
  Operator ← ⊢ Math~ScalarProduct
  Try ← Sng~Bloch π 0 Sng~Bloch 0 0
  Msg ← "Cross product of 2 opposing vectors should be 0"
---
---Qsuper
  Sqrt ↚ ⁿ 0.5 0.5
  Sqrti ↚ ⁿ 0.5 82
  Operator ← ⊢ Math~ScalarProduct
  Correct ← 0 0
  Try ←  Sng~Qsuper 1 0 Sng~Qsuper 0 1
  Msg ← "If the basis is orthogonal, the result should be 0"
  Operatori ←
  Correcti ←  ↯ 2_1 [Sqrt Sqrt]
  Tryi ←  Sng~Qsuper 5 5
  Msgi ← "A vector state with equal numbers should give you the state 1/sqrt(2) 1/sqrt(2)"
  Correctii ←  ↯ 2_1 [÷ Sqrti 1 ÷ Sqrti 9]
  Tryii ←  Sng~Qsuper 1 9
  Msgii ← "A vector state with different numbers should give you the state 1/sqrt(10) 3/sqrt(10)"
---
---test
  Round ↚ ∵Math~RoundAny 1e10
# Bloch states orthogonality
⍤⟜≍: ∩Round Bloch~Correct Bloch~Operator Bloch~Try
# Superposition states orthogonality
⍤⟜≍: ∩Round Qsuper~Correct Qsuper~Operator Qsuper~Try
# Superposition state with same amplitudes
⍤⟜≍: ∩Round Qsuper~Correcti Qsuper~Tryi
# Superposition state with different amplitudes
⍤⟜≍: ∩Round Qsuper~Correctii Qsuper~Tryii
---
