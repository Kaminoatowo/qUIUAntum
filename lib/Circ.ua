#Experimental!
~ "Sng.ua" ~ Qground
~ "Math.ua" ~ KroneckerProduct ScalarProduct
~ "Mlt.ua" ~ UnKPr
# Replace element in given position of given boxed array with given element
# Input: index 
#        element
#        array
Replace‼! ← ⍜(⊡ ^0|⊂ □ ^0 ^1 ◌) ^2
ArrayReg  ← ∵°□≡⊏ 1
# New ground state register
# Input: number of qubits
Reg ← ⍉↯⊂2⟜(⊂↯⊂:1 ⟜⇡)⟜(↯ : □Qground ⊂ :1)
# Obtain a subregister using qubit indices
# Input: qubit indices
#        register
Subregister ← ⊏
# Thread a set of Hilbert space entities into a larger Hilbert space entity
# Input: Qubits
Thread ← /KroneckerProduct
# Thread a (filtered) register into a vector state
# Input: register
ThreadReg ← /KroneckerProduct ArrayReg
# Thread a gate set into a single operation
# Input: gate set
ThreadGate ← + 0 /KroneckerProduct
# Unthread a vector state and produce a new register
# Input: vector state (register) 
┌─╴Unthreadm
  NumQubits ← ⧻
  RangeNum  ← ↯ ⊂ :1 ⟜(∵□ ⇡) NumQubits
  Call      ← ⟜RangeNum
└─╴
Unthread ← ☇1 ∵⊂ : Unthreadm UnKPr
# Build a table with the full binary representation of (2^n, 1) indices of an C^n vector
# Input: 2^(number of qubits)
TensorIndex ← ≡⇌⋯⇡ⁿ :2
# Map a qubit reordering into the tensor product row reordering
# Input: number of qubits
#        index reordering
QtoTReorder ← °⋯≡⇌°⍉⊏:(⍉TensorIndex)
┌─╴Stagem
  NumQubits   ← ₙ2 ⧻
  Qlist       ← ⇡ NumQubits
  OtherQubits ← ▽: ⟜(¬∈:)
  Ids = ⊞=.⇡ × 2 ⧻
  HowManyGates = ⍢(ThreadGate|>2⧻△) 
  TensorInd = QtoTReorder ⊸⧻ ⊂:⊸ OtherQubits
  TotalGate = ⨬(/◇KroneckerProduct □__2 HowManyGates :)(HowManyGates ◌) ⊸(=0⧻)
  F = ⍜◌(TotalGate) ⊃(⊂:)(Ids) ⊸ OtherQubits Qlist
  G = : ⟜(⍜⊏◌) : ×0°△ ⍜◌: ⊸△ ⍜◌TensorInd ⟜ Qlist
  Call ← ↯ ⊂ ⊸(: 1 ⧻) ⊏ : ScalarProduct ◌ ⊃F G
└─╴
# Apply a stage to a current vector state representing n qubits, with the given gates and
# a stated gate-dependent reordering (reordering a C^2 vector is less expensive than the gates)
# Input: vector state
#        index of qubit(s) to apply the gate(s)
#        gate(s)
Stage ← Stagem
# Replaces every occurance of 0 with ⍺ in ⍵. ⍺ must be of shape 1.
# Replaces every instance of 0 in ⍵ with the identity matrix
