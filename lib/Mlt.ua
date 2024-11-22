~ "Math.ua" ~ Math
┌─╴Mlt
  ┌─╴Separatem
    MakeList      ↚ ⇡ ⧻
    Nqb           ↚ ⁿ : 2 + ¯ 1 ₙ 2 ⧻
    Mask          ↚ ∵≍ 1 ◿ ⊸Nqb MakeList
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
  └─╴
  Separate ← Separatem
  ┌─╴UnKroneckerProductm
    Flatten ↚ Separate ♭
    Nqb     ↚ ⨬(0)(⊢) ⊸(> 0 ⧻) △
    Reshape ↚ ⇌↯⊂ : 2_1:≡Math~Normalize
    Call    ← Reshape ⟜Nqb Flatten
  └─╴
  UnKroneckerProduct ← UnKroneckerProductm
└─╴
