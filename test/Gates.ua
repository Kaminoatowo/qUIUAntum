# Experimental!
~ "../lib/Math.ua" ~ Math
~ "../lib/Gates.ua" ~ Gates
~ "../lib/MathExperimental.ua" ~ MathExp
Round!       ↚ ∵Math~RoundAny ^0
UnitaryTest‼ ↚ 1 Round!1e10 ^1 ⌵ MathExp~MDet ^0
ValueTest‼!  ↚ ^2 ^0 ^1
┌─╴CP
  Try     ← Gates~CP 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 ⊂ 1_0_0_0_0_1_0_0_0_0_1_0_0_0_0 Math~Exp × i 2
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴G
  Try     ← Gates~G 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (Math~Exp × i 2)_0_0_(Math~Exp × i 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴P
  Try     ← Gates~P 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 1_0_0_(Math~Exp × i 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Rx
  Try     ← Gates~Rx 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (∿ + η ÷ 2 2)_(ℂ (¯∿÷ 2 2) 0)_(ℂ (¯∿÷ 2 2) 0)_(∿ + η ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Ry
  Try     ← Gates~Ry 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (∿ + η ÷ 2 2)_(¯∿÷ 2 2)_(∿÷ 2 2)_(∿ + η ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴Rz
  Try     ← Gates~Rz 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯2_2 (Math~Exp ¯ × i ÷ 2 2)_0_0_(Math~Exp × i ÷ 2 2)
  Msgi    ← "Function should be calculating the same gate"
└─╴
┌─╴XX
  Try     ← Gates~XX 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (∿ + η ÷ 2 2)_0_0_(× i ¯ ∿ ÷ 2 2)
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    (× i ¯ ∿ ÷ 2 2)_0_0_(∿ + η ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴XY
  Try     ← Gates~XY 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    1_0_0_0
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    0_0_0_1]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴YY
  Try     ← Gates~YY 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (∿ + η ÷ 2 2)_0_0_(× i ∿ ÷ 2 2)
    0_(∿ + η ÷ 2 2)_(× i ¯ ∿ ÷ 2 2)_0
    0_(× i ¯ ∿ ÷ 2 2)_(∿ + η ÷ 2 2)_0
    (× i ∿ ÷ 2 2)_0_0_(∿ + η ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴ZZ
  Try     ← Gates~ZZ 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    (Math~Exp ¯ × i ÷ 2 2)_0_0_0
    0_(Math~Exp × i ÷ 2 2)_0_0
    0_0_(Math~Exp × i ÷ 2 2)_0
    0_0_0_(Math~Exp ¯ × i ÷ 2 2)]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴AthSwap
  Try     ← Gates~AthSwap 2
  Msg     ← "If 0, it means the generated matrix is not unitary"
  Correct ← ↯4_4 [
    1_0_0_0
    0_(÷ 2 + 1 Math~Exp × i τ)_(÷ 2 + 1 ¯ Math~Exp × i τ)_0
    0_(÷ 2 + 1 ¯ Math~Exp × i τ)_(÷ 2 + 1 Math~Exp × i τ)_0
    0_0_0_1]
  Msgi ← "Function should be calculating the same gate"
└─╴
┌─╴GCTR
  Try! ← Gates~GCTR ^0 ↯ 2_2 0_1_1_0
  Msg  ← "If 0, it means the generated matrix is not unitary"
  # CNOT
  TryCNOT     ← Gates~GCTR 1 ↯ 2_2 0_1_1_0
  CorrectCNOT ← Gates~CNOT
  Msgi        ← "You should be able to create the CNOT gate out of a generalized control gate"
  # FRK
  TryFRK ← Gates~GCTR 1 ↯ 4_4 [
    1_0_0_0
    0_0_1_0
    0_1_0_0
    0_0_0_1]
  CorrectFRK ← Gates~FRK
  Msgi       ← "You should be able to create the FRK gate out of a generalized control gate"
  # TOF
  TryTOF     ← Gates~GCTR 2 ↯ 2_2 0_1_1_0
  CorrectTOF ← Gates~TOF
  Msgi       ← "You should be able to create the TOF gate out of a generalized control gate"
└─╴
┌─╴test
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
  ⍤⟜≍: UnitaryTest‼Rx~Try Round!1e6
  # Rx value test
  ⍤⟜≍: ValueTest‼!Rx~Correct Rx~Try Round!1e6
  # Ry unitary test
  ⍤⟜≍: UnitaryTest‼Ry~Try Round!1e5
  # Ry value test
  ⍤⟜≍: ValueTest‼!Ry~Correct Ry~Try Round!1e6
  # Rz unitary test
  ⍤⟜≍: UnitaryTest‼Rz~Try
  # Rz value test
  ⍤⟜≍: ValueTest‼!Rz~Correct Rz~Try
  # XX unitary test
  ⍤⟜≍: UnitaryTest‼XX~Try Round!1e5
  # XX value test
  ⍤⟜≍: ValueTest‼!XX~Correct XX~Try Round!1e6
  # XY unitary test
  ⍤⟜≍: UnitaryTest‼XY~Try Round!1e6
  # XY value test
  ⍤⟜≍: ValueTest‼!XY~Correct XY~Try Round!1e6
  # YY unitary test
  ⍤⟜≍: UnitaryTest‼YY~Try Round!1e5
  # YY value test
  ⍤⟜≍: ValueTest‼!YY~Correct YY~Try Round!1e6
  # ZZ unitary test
  ⍤⟜≍: UnitaryTest‼ZZ~Try Round!1e5
  # ZZ value test
  ⍤⟜≍: ValueTest‼!ZZ~Correct ZZ~Try
  # AthSwap unitary test
  ⍤⟜≍: UnitaryTest‼AthSwap~Try
  # AthSwap value test
  ⍤⟜≍: ValueTest‼!AthSwap~Correct AthSwap~Try
  # GCTR unitary test
  ⍤⟜≍: UnitaryTest‼GCTR~Try!1
  ⍤⟜≍: UnitaryTest‼GCTR~Try!5
  # GCTR CNOT equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectCNOT GCTR~TryCNOT
  # GCTR FRK equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectFRK GCTR~TryFRK
  # GCTR TOF equivalent
  ⍤⟜≍: ValueTest‼!GCTR~CorrectTOF GCTR~TryTOF
└─╴
