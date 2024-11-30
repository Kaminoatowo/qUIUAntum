# Experimental!
┌─╴test
  # ~ "test/Test.ua"
└─╴
┌─╴debug
  MakeList ↚ ⇡ ⧻
  Nqb      ↚ ⁿ : 2 + ¯ 1 ₙ 2 ⧻
  # Mask          ↚ ∵≍ 1 ◿ ⊸Nqb MakeList
  Mask          ↚ ⌊ ÷ ⊸Nqb MakeList
  Partition     ↚ ⊕∘ ⊸Mask
  GCD           ↚ ⊙◌⍢(⟜◿:)(±,) # Greatest Common Divisor
  ConditionGCD  ↚ ∩(≍0/GCD) ⊃(⊡0)(⊡1)
  ConditionNone ↚ ∩(÷ ⟜/GCD) ⊃(⊡0)(⊡1)
  CaseMatch     ↚ ↯2_2 ⊂ ⊂ ∩(/GCD) ⊃(⊡0)(⊡1):
  CaseUnmatch   ↚ □↯4_1 ◌
  None          ↚ ⨬(CaseUnmatch)(CaseMatch) ⊸≍ ⊸ConditionNone # switch(resh:1onlen,)() 
  Some          ↚ ↯2_2 ⨬(⊂ 1_0 ⊡0)(⊂ 0_1 ⊡1) ⊸(≍0/GCD ⊡0)
  ChooseGCD     ↚ ⨬(None)(Some) ⊸(+ ConditionGCD) Partition # ⨬(None)(Some)
  Choose        ↚ ⨬(ChooseGCD)(□∘) ⊸(≍ 2 ⧻)
  Call          ← Choose # Choose
  GCDColRows    ← ⊃(/∵GCD)(≡/GCD) Partition
  F             ← ⨬(GCDColRows)("Len is 2") ⊸(≍ 2 ⧻)
  FMacro‼       ← ↯ ⊂+1^0 2_1 ⍥(⊂:)^0 ⍥(F)^0 ^1
└─╴
# H        ← ⊕∘ ⊸(⌊ ÷ ⊸(ⁿ : 2 + ¯ 1 ₙ 2 ⧻) ⇡ ⧻)
# G        ← ∩(≍0/(⊙◌⍢(⟜◿:)(±,))) ⊃(⊡0)(⊡1) H
# F        ← G H ♭
# RepeatF! ← ⍥(F)^0
# RepeatF!1 ↯ 4_1 1_0_0_0
# ↯4_1 1_0_0_0
# ⊸(/≡(⊙◌⍢(⟜◿:)(±,))) ↯ ⊂ :2⊸(÷2⧻)
# ÷⊡0⟜: ⊡0 ⍉,
# ⊂
~ "lib/Math.ua" ~ Math
~ "lib/Mlt.ua" ~ Mlt
# Ket ← ↯ 8_1 (Math~OneOverSqrt 8)_(Math~OneOverSqrt 24)_(Math~OneOverSqrt 4)_(Math~OneOverSqrt 12)
# ⍥(⊂:)3 ⍥(debug~F)3 ♭ Ket
Sqrt ↚ ⁿ ÷ 2 1 ÷ 2 1
□Sqrt
Math~RoundAny 1e6
Ket ← ↯ 4_1 [0.5 0.5 0.5 0.5]
Try ← Mlt~UnKroneckerProduct‼1 Ket
Math~RoundAny 1e10 Try
