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
  CheckLen   ↚ ⨬(GCDColRows)("Len is 2") ⊸(≍ 2 ⧻)
  #  Undo Kronecker product naively for vector states
  #  Input: number of qubits - 1
  #         vector state
  UnKroneckerProduct! ← ↯⊂:1⊸⧻≡□≡Normalize ↯ ⊂+1^0 2_1 ⍥(⊂:)^0 ⍥(CheckLen)^0 ♭