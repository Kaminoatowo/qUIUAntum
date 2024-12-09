~ "../lib/Math.ua" ~ OverSqrt RoundAny
~ "../lib/Circ.ua" ~ Reg Subregister Thread! ThreadGate ThreadReg Unthread!
~ "../lib/Utils.ua" ~ Replace‼!
┌─╴Subregister
  A        ↚ ↯2_1 1_0
  Regeg ↚ ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ A)]
  Try      ← Subregister 2 Regeg
  Msg      ← "Getting the correct subregister"
  Correct  ← ⊢ ↯1_2 (□ 2)_(□ A)
  B        ↚ ↯2_1 0_1
  Regegi ↚ ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ B)]
  Tryi     ← Subregister 4_0_5 Regegi
  Correcti ← ↯3_2 (□ 4)_(□ A)_(□ 0)_(□ A)_(□ 5)_(□ B)
└─╴
┌─╴Thread
  A         ↚ ↯2_1 1_0
  Try       ← Thread!2 A A A
  Msg       ← "Threading different vector states should give you the combined one on top"
  Correct   ← ↯8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
  Sqrt      ← OverSqrt 2
  Ai        ↚ ↯2_1 Sqrt_Sqrt
  Bi        ↚ ↯2_1 0_1
  Ci        ↚ ↯2_1 1_0
  Tryi      ← Thread!2 Ai Bi Ci
  Msg       ← "Threading different vector states should give you the combined one on top"
  Correcti  ← ↯8_1 0_0_Sqrt_0_0_0_Sqrt_0
  Tryii     ← Thread!3 Ai Ai Ai Ai
  Msg       ← "Threading different vector states should give you the combined one on top"
  Correctii ← ↯16_1 0.25
└─╴
┌─╴ThreadReg
  Register    ↚ Reg 3
  Try         ← ThreadReg Register
  Msg         ← "Threading different vector states should give you the combined one on top"
  Correct     ← ↯8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
  Sqrt        ← OverSqrt 2
  Correcti    ← ↯8_1 0_0_Sqrt_0_0_0_Sqrt_0
  A           ↚ □ ↯2_1 Sqrt_Sqrt
  B           ↚ □ ↯2_1 0_1
  C           ↚ □ ↯2_1 1_0
  Registerii  ← Replace‼!2 C Replace‼!1 B Replace‼!0 A Register
  Tryi        ← ThreadReg Registerii
  Correctii   ← ↯16_1 0.25
  Registeriii ← Replace‼!3 A Replace‼!2 A Replace‼!1 A Replace‼!0 A Reg 4
  Tryii       ← ThreadReg Registeriii
└─╴
┌─╴ThreadGate
  ~ "../lib/Gates.ua" ~ H X Z
  Sqrt     ← OverSqrt 2
  Try      ← ThreadGate H_X
  Msg      ← "Testing H kpr X"
  Correct ← ↯4_4 [
    0_Sqrt_0_Sqrt
    Sqrt_0_Sqrt_0
    0_Sqrt_0_(¯ Sqrt)
    Sqrt_0_(¯ Sqrt)_0]
  Tryi     ← ThreadGate Z_H_X
  Msgi     ← "Testing Z kpr H kpr X"
  Correcti ← ↯8_8 [
    0_Sqrt_0_Sqrt_0_0_0_0
    Sqrt_0_Sqrt_0_0_0_0_0
    0_Sqrt_0_(¯ Sqrt)_0_0_0_0
    Sqrt_0_(¯ Sqrt)_0_0_0_0_0
    0_0_0_0_0_(¯ Sqrt)_0_(¯ Sqrt)
    0_0_0_0_(¯ Sqrt)_0_(¯ Sqrt)_0
    0_0_0_0_0_(¯ Sqrt)_0_Sqrt
    0_0_0_0_(¯ Sqrt)_0_Sqrt_0]
└─╴
┌─╴Unthread
  A       ← ↯ 2_1 1_0
  Try     ← Unthread!2 ↯ 8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
  Correct ← ↯ 3_2 (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
  Msg     ← "Unthreading a vs into the states defined above"
└─╴
┌─╴Reg
  A        ↚ ↯2_1 1_0
  Try      ← Reg 3
  Msg      ← "Testing correct register instantiation"
  Correct  ← ↯3_2 (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
  Tryi     ← Reg 6
  Msgi     ← "Testing correct register instantiation"
  Correcti ← ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ A)]
└─╴
┌─╴test
  Round ← RoundAny1e10
  # Register instantiation
  ⍤⟜≍: ∩Round Reg~Correct Reg~Try
  ⍤⟜≍: ∩Round Reg~Correcti Reg~Tryi
  # Replace
  # Tensor product row reordering
  # Stage
  # Subregister
  ⍤⟜≍: ∩Round Subregister~Correct Subregister~Try
  ⍤⟜≍: ∩Round Subregister~Correcti Subregister~Tryi
  # Thread
  ⍤⟜≍: ∩Round Thread~Correct Thread~Try
  ⍤⟜≍: ∩Round Thread~Correcti Thread~Tryi
  ⍤⟜≍: ∩Round Thread~Correctii Thread~Tryii
  # ThreadReg
  ⍤⟜≍: ∩Round ThreadReg~Correct ThreadReg~Try
  ⍤⟜≍: ∩Round ThreadReg~Correcti ThreadReg~Tryi
  ⍤⟜≍: ∩Round ThreadReg~Correctii ThreadReg~Tryii
  # ThreadGate
  ⍤⟜≍: ∩Round ThreadGate~Correct ThreadGate~Try
  ⍤⟜≍: ∩Round ThreadGate~Correcti ThreadGate~Tryi
  # Unthread
  ⍤⟜≍: ∩Round Unthread~Correct Unthread~Try
└─╴
