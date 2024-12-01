# Experimental!
~ "../lib/Math.ua" 
~ RoundAny Exp 
~ "../lib/Gates.ua" 
~ CP G P Rx Ry Rz XX XY YY ZZ AthSwap GCTR CNOT FRK TOF
~ "../lib/MathExperimental.ua" 
~ MDet
Round!       ↚ ∵RoundAny ^0
RoundDeca = Round!1e10
UnitaryTest‼ ↚ 1 RoundDeca ^1 ⌵ MDet ^0
ValueTest‼!  ↚ both(^2) ^0 ^1
┌─╴CP
  Try     ← CP 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 ⊂ 1_0_0_0_0_1_0_0_0_0_1_0_0_0_0 Exp × i 2
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴G
  Try     ← G 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (Exp × i 2)_0_0_(Exp × i 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴P
  Try     ← P 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 1_0_0_(Exp × i 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Rx
  Try     ← Rx 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (∿ + η ÷ 2 2)_(ℂ (¯∿÷ 2 2) 0)_(ℂ (¯∿÷ 2 2) 0)_(∿ + η ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Ry
  Try     ← Ry 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (∿ + η ÷ 2 2)_(¯∿÷ 2 2)_(∿÷ 2 2)_(∿ + η ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Rz
  Try     ← Rz 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (Exp ¯ × i ÷ 2 2)_0_0_(Exp × i ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴XX
  Try     ← XX 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (∿ + η ÷ 2 2)_0_0_(× i ¯ ∿ ÷ 2 2)
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    (× i ¯ ∿ ÷ 2 2)_0_0_(∿ + η ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴XY
  Try     ← XY 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    1_0_0_0
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    0_0_0_1]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴YY
  Try     ← YY 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (∿ + η ÷ 2 2)_0_0_(× i ∿ ÷ 2 2)
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    (× i ∿ ÷ 2 2)_0_0_(∿ + η ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴ZZ
  Try     ← ZZ 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (Exp ¯ × i ÷ 2 2)_0_0_0
    0_(Exp × i ÷ 2 2)_0_0
    0_0_(Exp × i ÷ 2 2)_0
    0_0_0_(Exp ¯ × i ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴AthSwap
  Try     ← AthSwap 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    1_0_0_0
    0_(÷ 2 + 1 Exp × i τ)_(÷ 2 + 1 ¯ Exp × i τ)_0
    0_(÷ 2 + 1 ¯ Exp × i τ)_(÷ 2 + 1 Exp × i τ)_0
    0_0_0_1]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴GCTR
  Try ← GCTR : ↯ 2_2 0_1_1_0
  Msg  ← "If 0, it means the generated matrix is not unitary"
  # CNOT
  TryCNOT     ← GCTR 1 ↯ 2_2 0_1_1_0
  CorrectCNOT ← CNOT
  Msgi        ← "You should be able to create the CNOT gate out of a generalized control gate"
  # FRK
  TryFRK ← GCTR 1 ↯ 4_4 [
    1_0_0_0
    0_0_1_0
    0_1_0_0
    0_0_0_1]
  CorrectFRK ← FRK
  Msgi       ← "You should be able to create the FRK gate out of a generalized control gate"
  # TOF
  TryTOF     ← GCTR 2 ↯ 2_2 0_1_1_0
  CorrectTOF ← TOF
  Msgi       ← "You should be able to create the TOF gate out of a generalized control gate"
└─╴
┌─╴test
RoundEsa = Round!1e6
RoundPenta = Round!1e5
  # CP unitary test
  ⍤⟜≍: UnitaryTest‼CP~Try
  # CP value test
  ⍤⟜≍: ValueTest‼!CP~Correct CP~Try
  # G unitary test
  ⍤⟜≍: UnitaryTest‼G~Try
  # G value test
  ⍤⟜≍: ValueTest‼!G~Correct G~Try
  # P unitary test
  ⍤⟜≍: UnitaryTest‼P~Try
  # P value test
  ⍤⟜≍: ValueTest‼!P~Correct P~Try
  # Rx unitary test
  ⍤⟜≍: UnitaryTest‼Rx~Try RoundEsa
  # Rx value test
  ⍤⟜≍: ValueTest‼!Rx~Correct Rx~Try RoundEsa
  # Ry unitary test
  ⍤⟜≍: UnitaryTest‼Ry~Try RoundPenta
  # Ry value test
  ⍤⟜≍: ValueTest‼!Ry~Correct Ry~Try RoundEsa
  # Rz unitary test
  ⍤⟜≍: UnitaryTest‼Rz~Try
  # Rz value test
  ⍤⟜≍: ValueTest‼!Rz~Correct Rz~Try
  # XX unitary test
  ⍤⟜≍: UnitaryTest‼XX~Try RoundPenta
  # XX value test
  ⍤⟜≍: ValueTest‼!XX~Correct XX~Try RoundEsa
  # XY unitary test
  ⍤⟜≍: UnitaryTest‼XY~Try RoundEsa
  # XY value test
  ⍤⟜≍: ValueTest‼!XY~Correct XY~Try RoundEsa
  # YY unitary test
  ⍤⟜≍: UnitaryTest‼YY~Try RoundPenta
  # YY value test
  ⍤⟜≍: ValueTest‼!YY~Correct YY~Try RoundEsa
  # ZZ unitary test
  ⍤⟜≍: UnitaryTest‼ZZ~Try RoundPenta
  # ZZ value test
  ⍤⟜≍: ValueTest‼!ZZ~Correct ZZ~Try
  # AthSwap unitary test
  ⍤⟜≍: UnitaryTest‼AthSwap~Try
  # AthSwap value test
  ⍤⟜≍: ValueTest‼!AthSwap~Correct AthSwap~Try
  # GCTR unitary test
  ⍤⟜≍: UnitaryTest‼(GCTR~Try 1)
  ⍤⟜≍: UnitaryTest‼(GCTR~Try 5)
  # GCTR CNOT equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectCNOT GCTR~TryCNOT
  # GCTR FRK equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectFRK GCTR~TryFRK
  # GCTR TOF equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectTOF GCTR~TryTOF
└─╴
