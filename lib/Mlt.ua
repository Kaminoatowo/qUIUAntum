  ~ "Math.ua"
  ~ GCD
  ~ Normalize
  ┌─╴Partition
    MakeList ↚ ⇡ ⧻
    Nqb      ↚ ⁿ : 2 + ¯ 1 ₙ 2 ⧻
    # Mask          ↚ ∵≍ 1 ◿ ⊸Nqb MakeList
    Mask ↚ ⌊ ÷ ⊸Nqb MakeList
    Call ↚ ⊕∘ ⊸Mask
  └─╴
  GCDColRows ← ⊃(/∵GCD)(≡/GCD) Partition
  Auxiliary = |1 /◇⊂ ⨬(⍚ Auxiliary ⊟ ∩ □ GCDColRows ♭|∘)≍2⧻.
  #  Undo Kronecker product naively for vector states
  #  Input: vector state
  UnKPr ← ↯⊂:1⊸⧻≡ □ ≡Normalize ↯⊂:2_1⊸(div2⧻) Auxiliary