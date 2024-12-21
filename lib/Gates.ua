~ "Math.ua"
  ~ IExp Exp
  ~ LHCD
  ~ OvSqTwo
  ~ RHCD
  ~ SinAndCos
# Identity gate
I ← ⊞=.⇡2
# Global phase
# Input: phase in [0, τ]
G ← ×I IExp
# Pauli X gate
X ← ↯2_2 0_1_1_0
# Pauli Y gate
Y ← ↯2_2 0_(¯i)_i_0
# Pauli Z gate
Z ← ↯2_2 1_0_0_¯1
# S gate - sqrt Z
S ← ↯2_2 1_0_0_i
# V gate - sqrt X
V ← ÷2 ↯2_2 (ℂ 1 1)_(ℂ 1 ¯1)_(ℂ ¯1 1)_(ℂ 1 1)
# Hadamard gate
H ← ÷√2 ↯2_2 1_1_1_¯1
# T gate - sqrt S
T ← ↯2_2 1_0_0_(IExp ÷4 π)
# Phase shift gate
# Input: phase in [0, τ]
P ← ↯ 2_2 ⊂ 1_0_0 IExp
# Rotation around X axis
# Input: phase in [0, τ]
Rx =⊟ ⟜⇌ ⊂ ×¯i SinAndCos ÷2
# Rotation around Y axis
# Input: phase in [0, τ]
Ry = ⊟ : ⟜(⇌⍜(⊢)¯) ⊂ SinAndCos ÷2
# Rotation around Z axis
# Input: phase in [0, τ]
Rz = ⊟ ⇌ ∩(join 0 IExp) ⊸¯ ÷ 2
# Generalized rotation
# Input: theta phi lamda
# theta in [0, π]
# phi in [0, τ]
# lamda in [0, τ]
┌─╴Um
  PrepareData = ⊓(SinAndCos÷2)(⊃(IExp ¯)(IExp +) :)
  MulExtreme  ← ⍜◌( ⊃(⊢)(×)) :
  ForkBetween ← ⍜◌(⊃(¯)(∘)×) :
  Call        ← ∩⊟ MulExtreme ForkBetween PrepareData
└─╴
U ← ⊟⇌ Um
# Controlled NOT gate
CNOT ← ↯4_4 [
  1_0_0_0
  0_1_0_0
  0_0_0_1
  0_0_1_0]
# Square root of NOT gate
SqNOT ← ÷2 ↯2_2 + 1_1_1_1 i_(¯i)_(¯i)_i
# XNOR gate
XNOR ← ↯4_4 [
  0_1_0_0
  1_0_0_0
  0_0_1_0
  0_0_0_1]
# CY
CY ← ↯4_4 [
  1_0_0_0
  0_1_0_0
  0_0_0_(¯i)
  0_0_i_1]
# CZ
CZ ← ↯4_4 [
  1_0_0_0
  0_1_0_0
  0_0_1_0
  0_0_0_¯1]
# Controlled phase
# Input: phase in [0, τ]
CP ← ↯4_4 ⊂ 1_0_0_0_0_1_0_0_0_0_1_0_0_0_0 IExp
# Controlled phase S
CS ← ↯4_4 [
  1_0_0_0
  0_1_0_0
  0_0_1_0
  0_0_0_i]
# XX interaction
# Input: phase in [0, τ]
┌─╴XXm
  Prepare ↚ ¯×i SinAndCos ÷2
  MakeLines =~ ⊃(⊂⇌:)(⇌⊂⊙⇌)
  RevAndJoin =~ ⊂⟜⇌♭⊟
  BothZero =~ ∩(⊂0)
  Call =  RevAndJoin MakeLines BothZero Prepare
└─╴
XX ← ↯4_4 XXm
# YY interaction
# Input: phase in [0, τ]
┌─╴YYm
  Prepare ↚ ⊃¯(×i) SinAndCos ÷2
  BothZero =~ ∩(⊂0)
  MakeLines =~ ⊃(⊂⇌:BothZero◌)(⊂:⇌BothZero◌:)
  RevAndJoin =~ ⊂⟜⇌♭⊟
  Call = RevAndJoin MakeLines Prepare
└─╴
YY ← ↯4_4 YYm
# ZZ interaction
# Input: phase in [0, τ]
┌─╴ZZm
  Prepare  ↚ ∩IExp ⟜¯ ÷2
  BothZero =~ ∩(⊂0_0_0)
  RevAndJoin =~ ⊂:⟜⇌♭
  Call     ← RevAndJoin ⊂↻1 BothZero Prepare
└─╴
ZZ ← ↯4_4 ZZm
# XY Interaction (XX + YY)
# Input: phase in [0, τ]
┌─╴XYm
  Prepare ↚ ¯×i SinAndCos ÷2
  OneVec  ↚ 1_0_0_0
  BothZero =~ ∩(⊂0)
  RevAndJoin =~ ⊂⟜⇌
  Call = RevAndJoin ⊂ OneVec ⊂:⇌BothZero Prepare
└─╴
XY ← ↯4_4 XYm
# Double Controlled NOT
DCNOT ← ↯4_4 [
  1 0 0 0
  0 0 1 0
  0 0 0 1
  0 1 0 0]
# SWAP
Swap ← ↯4_4 [
  1 0 0 0
  0 0 1 0
  0 1 0 0
  0 0 0 1]
# Imaginary SWAP
ImSwap ← ↯4_4 [
  1 0 0 0
  0 0 i 0
  0 i 0 0
  0 0 0 1]
# Fermionic SWAP
FSwap ← ↯4_4 [
  1 0 0 0
  0 0 1 0
  0 1 0 0
  0 0 0 ¯1]
# Square root SWAP
SqSwap ← ↯4_4 [
  1_0_0_0
  0_RHCD_LHCD_0
  0_LHCD_RHCD_0
  0_0_1_1]
# Square root imaginary SWAP
SqImSwap ← ↯4_4 [
  1_0_0_0
  0_(OvSqTwo)_(× OvSqTwo i)_0
  0_(× OvSqTwo i)_(OvSqTwo)_0
  0_0_0_1]
# Swap raised to the a-th power
# Input: a-th power
┌─╴AthSwapm
  Prepare  ↚ ∩(÷2+1)⊸¯ IExp × π
  BothZero =~ ∩(⇌⊂0)
  OneVec   ↚ 1_0_0_0
  RevAndJoin =~ ⊂⟜⇌
  Call     ← RevAndJoin ⊂ OneVec ⊂⇌ BothZero Prepare
└─╴
AthSwap ← ↯4_4 AthSwapm
# Fredkin (Control SWAP)
FRK ← ↯8_8 [
  1 0 0 0 0 0 0 0
  0 1 0 0 0 0 0 0
  0 0 1 0 0 0 0 0
  0 0 0 1 0 0 0 0
  0 0 0 0 1 0 0 0
  0 0 0 0 0 0 1 0
  0 0 0 0 0 1 0 0
  0 0 0 0 0 0 0 1]
# Toffoli (Doubly-controlled NOT)
TOF ← ↯8_8 [
  1 0 0 0 0 0 0 0
  0 1 0 0 0 0 0 0
  0 0 1 0 0 0 0 0
  0 0 0 1 0 0 0 0
  0 0 0 0 1 0 0 0
  0 0 0 0 0 1 0 0
  0 0 0 0 0 0 0 1
  0 0 0 0 0 0 1 0]
# Generalized controlled gate with k-qubit controls
# Input: number of (preceding) control qubits
#        gate
┌─╴GCTRm
  ID     ↚ ⊞=.⇡
  GetDim ↚ ⁿ : 2+ ₙ2 ⧻
  ReplaceSubMatrix ↚ ⍜↙◌ ¯△,
  Call             ← ReplaceSubMatrix ID GetDim,
└─╴
GCTR ← GCTRm
