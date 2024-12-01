~ "Math.ua"
  ~ Exp
  ~ LHCD
  ~ OvSqTwo
  ~ RHCD
  ~ SinAndCos
# Identity gate
I ← ⊞=.⇡2
# Global phase
# Input: phase in [0, τ]
G ← ×I Exp × i
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
T ← ↯2_2 1_0_0_(Exp × i ÷4 π)
# Phase shift gate
# Input: phase in [0, τ]
P ← ↯ 2_2 ⊂ 1_0_0 Exp × i
# Rotation around X axis
# Input: phase in [0, τ]
Rx ← ↯2_2⊂⟜⇌⊂:× ¯ i SinAndCos ÷2
# Rotation around Y axis
# Input: phase in [0, τ]
Ry ← ↯2_2⊂:⟜(⊢⇌)⊂⊂:⟜¯SinAndCos ÷2
# Rotation around Z axis
# Input: phase in [0, τ]
Rz ← ↯2_2 ⇌⊂⇌⊂ 0_0 ∩Exp ⟜¯× i ÷ 2
# Generalized rotation
# Input: theta phi lamba
# theta in [0, π]
# phi in [0, τ]
# lamda in [0, τ]
┌─╴Um
  MulExtreme  ← ∘⊙⊙∘ ×
  ForkBetween ← ⊙⊙⊃¯∘⟜×
  JoinStack   ← ⊂:⊙⊂: ⊙⊙⊂
  Call        ← JoinStack ForkBetween MulExtreme SinAndCos÷2⊙(Exp × i +)⊙⊙⟜(Exp × ¯ i) # SinAndCos÷2
└─╴
U ← ↯2_2 Um
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
CP ← ↯4_4 ⊂ 1_0_0_0_0_1_0_0_0_0_1_0_0_0_0 Exp × i
# Controlled phase S
CS ← ↯4_4 [
  1_0_0_0
  0_1_0_0
  0_0_1_0
  0_0_0_i]
# XX interaction
# Input: phase in [0, τ]
┌─╴XXm
  Prepare ↚ × ¯ i SinAndCos ÷2
  XOOY    ↚ ⊂:⊂ 0_0
  OYXO    ↚ ↻2
  Reorder ↚ ⊂:⊂⊂∩(⇌.):
  Call    ← Reorder⟜OYXO XOOY Prepare
└─╴
XX ← ↯4_4 XXm # (⊂⇌⊂ 0_0)
# YY interaction
# Input: phase in [0, τ]
┌─╴YYm
  Prepare ↚ ⊃¯∘(× i) SinAndCos ÷2
  DupLast ↚ ⊙⊙.
  XOOYp   ↚ ⊂:⊂ 0_0
  Move    ↚ ⊙:
  OYmXO   ↚ ⊂ 0⇌⊂⊂ 0
  Reorder ↚ ⊂:⊂⊂∩(⇌.)
  Call    ← Reorder ⊙XOOYp ⇌OYmXO Move DupLast Prepare
└─╴
YY ← ↯4_4 YYm
# ZZ interaction
# Input: phase in [0, τ]
┌─╴ZZm
  Prepare  ↚ ∩Exp ⟜¯× i ÷2
  TwoZeros ↚ ∩(⊂ :0_0)
  XmOOO    ↚ ⊂ :0
  OXpOO    ↚ ⇌⊂ 0
  Reorder  ↚ ⊂:⊂⊂∩(⇌.):
  Call     ← Reorder XmOOO : OXpOO TwoZeros Prepare
└─╴
ZZ ← ↯4_4 ZZm
# XY Interaction (XX + YY)
# Input: phase in [0, τ]
┌─╴XYm
  Prepare ↚ × ¯ i SinAndCos ÷2
  OneVec  ↚ 1_0_0_0
  OYXO    ↚ ⊂ 0⇌⊂⊂ 0
  Reorder ↚ ⊂:⊙⊂
  Call    ← Reorder ⊃⇌∘OneVec ⊂⟜⇌OYXO Prepare
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
  Prepare  ↚ ∩(÷2+1)⊃¯∘ Exp × i × π
  AddZeros ↚ ⇌⊂ 0⇌⊂ 0
  OneVec   ↚ 1_0_0_0
  Call     ← ⊂ OneVec ⇌ ⊂ OneVec ⊂⇌. AddZeros ⊂ Prepare
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
  # ZerosMat ↚ ↯ : 0 ⊂.× 2 # ⊸⧻
  ReplaceSubMatrix ↚ ⍜↙◌ ¯△,
  Call             ← ReplaceSubMatrix ID GetDim,
  # not finished yet
└─╴
GCTR ← GCTRm
