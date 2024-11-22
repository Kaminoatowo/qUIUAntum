~ "../lib/Math.ua" ~ Math
~ "../lib/Circ.ua" ~ Circ
~ "../lib/Utils.ua" ~ Utils
┌─╴Reg
  A        ↚ ↯2_1 1_0
  Try      ← Circ~Reg 3
  Msg      ← "Testing correct register instantiation"
  Correct  ← ↯3_2 (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
  Tryi     ← Circ~Reg 6
  Msgi     ← "Testing correct register instantiation"
  Correcti ← ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ A)]
└─╴
┌─╴Subregister
  A        ↚ ↯2_1 1_0
  Regeg ↚ ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ A)]
  Try      ← Circ~Subregister 2 Regeg
  Msg      ← "Getting the correct subregister"
  Correct  ← ⊢ ↯1_2 (□ 2)_(□ A)
  B        ↚ ↯2_1 0_1
  Regegi ↚ ↯6_2 [
    (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
    (□ 3)_(□ A)_(□ 4)_(□ A)_(□ 5)_(□ B)]
  Tryi     ← Circ~Subregister 4_0_5 Regegi
  Correcti ← ↯3_2 (□ 4)_(□ A)_(□ 0)_(□ A)_(□ 5)_(□ B)
└─╴
---Thread
    A        ↚ ↯2_1 1_0
Try      ← Circ~Thread!2 A A A
    Msg      ← "Threading different vector states should give you the combined one on top"
  Correct     ← ↯8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
Sqrt       ← ⁿ ÷ 2 1 ÷ 2 1
Ai        ↚ ↯2_1 Sqrt_Sqrt
Bi        ↚ ↯2_1 0_1
Ci        ↚ ↯2_1 1_0
Tryi      ← Circ~Thread!2 Ai Bi Ci
    Msg      ← "Threading different vector states should give you the combined one on top"
  Correcti     ← ↯8_1 0_0_Sqrt_0_0_0_Sqrt_0
Tryii     ← Utils~Round!1e10 Circ~Thread!3 Ai Ai Ai Ai
    Msg      ← "Threading different vector states should give you the combined one on top"
  Correctii     ← ↯16_1 0.25
---
┌─╴ThreadReg
  Register    ↚ Circ~Reg 3
  Try         ← Circ~ThreadReg Register
  Msg         ← "Threading different vector states should give you the combined one on top"
  Correct     ← ↯8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
  Sqrt        ← ⁿ ÷ 2 1 ÷ 2 1
  Correcti    ← ↯8_1 0_0_Sqrt_0_0_0_Sqrt_0
  A           ↚ □ ↯2_1 Sqrt_Sqrt
  B           ↚ □ ↯2_1 0_1
  C           ↚ □ ↯2_1 1_0
  Registerii  ← Circ~Replace‼!2 C Circ~Replace‼!1 B Circ~Replace‼!0 A Register
  Tryi        ← Circ~ThreadReg Registerii
  Correctii   ← ↯16_1 0.25
  Registeriii ← Circ~Replace‼!3 A Circ~Replace‼!2 A Circ~Replace‼!1 A Circ~Replace‼!0 A Circ~Reg 4
  Tryii       ← Utils~Round!1e10 Circ~ThreadReg Registeriii
└─╴
---ThreadGate
~ "../lib/Gates.ua" ~ Gates
Sqrt ← ⁿ ÷ 2 1 ÷ 2 1
Try = Utils~Round!1e10 add 0 Circ~ThreadGate!1 Gates~H Gates~X
Msg = "Testing H kpr X"
Correct = Utils~Round!1e10 resh4_4 [0_Sqrt_0_Sqrt
                   Sqrt_0_Sqrt_0
                    0_Sqrt_0_(neg Sqrt) 
                   Sqrt_0_(neg Sqrt)_0]
Tryi = Utils~Round!1e10 add 0 Circ~ThreadGate!2 Gates~Z Gates~H Gates~X
Msgi = "Testing Z kpr H kpr X"
Correcti = Utils~Round!1e10 resh8_8 [0_Sqrt_0_Sqrt_0_0_0_0
                                    Sqrt_0_Sqrt_0_0_0_0_0
                                    0_Sqrt_0_(neg Sqrt)_0_0_0_0
                                    Sqrt_0_(neg Sqrt)_0_0_0_0_0
                                    0_0_0_0_0_(neg Sqrt)_0_(neg Sqrt)
                                    0_0_0_0_(neg Sqrt)_0_(neg Sqrt)_0
                                    0_0_0_0_0_(neg Sqrt)_0_Sqrt
                                    0_0_0_0_(neg Sqrt)_0_Sqrt_0]
---
---Unthread
A = ↯ 2_1 1_0
Try = Circ~Unthread resh 8_1 1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0
Correct = ↯ 3_2 (□ 0)_(□ A)_(□ 1)_(□ A)_(□ 2)_(□ A)
Msg = "Unthreading a vs into the states defined above"
---
┌─╴test
  # Register instantiation
  ⍤⟜≍: Reg~Correct Reg~Try
  ⍤⟜≍: Reg~Correcti Reg~Tryi
  # Replace
  # Tensor product row reordering
  # Stage
  # Subregister
  ⍤⟜≍: Subregister~Correct Subregister~Try
  ⍤⟜≍: Subregister~Correcti Subregister~Tryi
    # Thread
    ⍤⟜≍: Thread~Correct Thread~Try
    ⍤⟜≍: Thread~Correcti Thread~Tryi
    ⍤⟜≍: Thread~Correctii Thread~Tryii
  # ThreadReg
  ⍤⟜≍: ThreadReg~Correct ThreadReg~Try
  ⍤⟜≍: ThreadReg~Correcti ThreadReg~Tryi
  ⍤⟜≍: ThreadReg~Correctii ThreadReg~Tryii
    # ThreadGate
    ⍤⟜≍: ThreadGate~Correct ThreadGate~Try
    ⍤⟜≍: ThreadGate~Correcti ThreadGate~Tryi
  # Unthread
  ⍤⟜≍: Unthread~Correct Unthread~Try
└─╴
