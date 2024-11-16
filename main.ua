# I'm trying to build a tool set fordoing quantum computing in UIUA
# Inspired by the work done for quAPL by
# Santiago Núñez-Corrales, PhD (nunezco2@illinois.edu)
# Marcos Frenkel (marcosf2@illinois.edu)
# Bruno de Abreu (babreu@illinois.edu)
# National Center for Supercomputing Applications

# -----------------------------------------------------------

# -----------------------------------------------------------
# Part 0: Math functions
---Math
  ScalarProduct ← /+×
  Conjugate ← ⍜°ℂ¯
  Dagger ← Conjugate
  Normalize ← ÷√:⟜(ScalarProduct⟜Dagger) # this works for ket vectors
  Exp ← ⁿ:e
  RoundEsa ← × ⟜(>0.000001⌵)
  SinAndCos ← ∩RoundEsa ⊃(∿)(∿+η)
  RHCD ← ÷2(ℂ1 1)  # Right half complex diagonal
  LHCD ← ÷2(ℂ¯1 1) # Left half complex diagonal
  OvSqTwo ← ÷√2
  RealPart ← ◌°ℂ
  ImPart ← ◌:°ℂ
  SignToBit ← ÷2+1±
  MixOrPure ← =1⊢/+
---

# -----------------------------------------------------------
# Part I: Single qubit manipulation (Sng)
---Sng
  # Ground state |0>⌈
  Qground ← ↯2_1 1_0
  # Excited state |1>
  Qexcited ← ↯2_1 0_1
  # Superposition starter
  Qstarter ← [Qground Qexcited]
  # Linear superposition of amplitudes
  # Input: the relative amplitudes for the G and E states
  Qsuper ← Math~Normalize Math~ScalarProduct Qstarter ⊂
  # Bloch state
  # Input: Bloch angles, in order theta and phi
  # theta in [0, π]
  # phi in [0, τ]
  Bloch ← Math~ScalarProduct Qstarter ×⊂1ℂ⊃∿(∿+η):⊂⊃(∿+η)∿÷2
  # Projector operator to 0
  Pground ← ↯2_2 1_0_0_0
  # Projector operator to 1
  Pexcited ← ↯2_2 0_0_0_1
---

# -----------------------------------------------------------
# Part II: Quantum gates (gates)
---Gates
  # Identity gate
  I ← ↯2_2 1_0_0_1
  # Global phase
  # Input: phase in [0, τ]
  G ← ×I Math~Exp × i
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
  T ← ↯2_2 1_0_0_(Math~Exp × i ÷4 π)
  # Phase shift gate
  # Input: phase in [0, τ]
  P ← ↯ 2_2 ⊂ 1_0_0 Math~Exp × i
  # Rotation around X axis
  # Input: phase in [0, τ]
  Rx ← ↯2_2⊂⟜⇌⊂:× ¯ i Math~SinAndCos ÷2
  # Rotation around Y axis
  # Input: phase in [0, τ]
  Ry ← ↯2_2⊂:⟜(⊢⇌)⊂⊂:⟜¯Math~SinAndCos
  # Rotation around Z axis
  # Input: phase in [0, τ]
  Rz ← ↯2_2 ⇌⊂⇌⊂ 0_0 ∩Math~Exp ⟜¯× i ÷ 2
  # Generalized rotation
  # Input: theta phi lamba
  # theta in [0, π]
  # phi in [0, τ]
  # lamda in [0, τ]
  ---Um
    MulExtreme ← ∘⊙⊙∘ ×
    ForkBetween ← ⊙⊙⊃¯∘⟜×
    JoinStack ← ⊂:⊙⊂: ⊙⊙⊂
    Call ← JoinStack ForkBetween MulExtreme Math~SinAndCos÷2⊙(Math~Exp × i +)⊙⊙⟜(Math~Exp × ¯ i) # SinAndCos÷2
  ---
  U ← ↯2_2 Um
  # Controlled NOT gate
  CNOT ← ↯4_4 [1_0_0_0
               0_1_0_0
               0_0_0_1
               0_0_1_0]
  # Square root of NOT gate
  SqNOT ← ÷2 ↯2_2 + 1_1_1_1 i_(¯i)_(¯i)_i
  # XNOR gate
  XNOR ← ↯4_4 [0_1_0_0
               1_0_0_0
               0_0_1_0
               0_0_0_1]
  # CY
  CY ← ↯4_4 [1_0_0_0
             0_1_0_0
             0_0_0_(¯i)
             0_0_i_1]
  # CZ
  CZ ← ↯4_4 [1_0_0_0
             0_1_0_0
             0_0_1_0
             0_0_0_¯1]
  # Controlled phase
  # Input: phase in [0, τ]
  CP ← ↯4_4 ⊂ 1_0_0_0_0_1_0_0_0_0_1_0_0_0_0 Math~Exp × i
  # Controlled phase S
  CS ← ↯4_4 [1_0_0_0
             0_1_0_0
             0_0_1_0
             0_0_0_i]
  # XX interaction
  # Input: phase in [0, τ]
  ---XXm
    Prepare ↚ × ¯ i Math~SinAndCos ÷2
    XOOY ↚ ⊂:⊂ 0_0
    OYXO ↚ ↻2
    Reorder ↚ ⊂:⊂⊂∩(⇌.):
    Call ← Reorder⟜OYXO XOOY Prepare
  ---
  XX ← ↯4_4 XXm # (⊂⇌⊂ 0_0)
  # YY interaction
  # Input: phase in [0, τ]
  ---YYm
    Prepare ↚ ⊃¯∘(× i) Math~SinAndCos ÷2
    DupLast ↚ ⊙⊙.
    XOOYp ↚ ⊂:⊂ 0_0
    Move ↚ ⊙:
    OYmXO ↚ ⊂ 0⇌⊂⊂ 0
    Reorder ↚ ⊂:⊂⊂∩(⇌.)
    Call ← Reorder ⊙XOOYp ⇌OYmXO Move DupLast Prepare
  ---
  YY ← ↯4_4 YYm
  # ZZ interaction
  # Input: phase in [0, τ]
  ---ZZm
    Prepare ↚ ∩Math~Exp ⟜¯× i ÷2
    TwoZeros ↚ ∩(⊂ :0_0)
    XmOOO ↚ ⊂ :0
    OXpOO ↚ ⇌⊂ 0
    Reorder ↚ ⊂:⊂⊂∩(⇌.):
    Call ← Reorder XmOOO : OXpOO TwoZeros Prepare
  ---
  ZZ ← ↯4_4 ZZm
  # XY Interaction (XX + YY)
  # Input: phase in [0, τ]
  ---XYm
    Prepare ↚ × ¯ i Math~SinAndCos ÷2
    OneVec ↚ 1_0_0_0
    OYXO ↚ ⊂ 0⇌⊂⊂ 0
    Reorder ↚ ⊂:⊙⊂
    Call ← Reorder ⊃⇌∘OneVec ⊂⟜⇌OYXO Prepare
  ---
  XY ← ↯4_4 XYm
  # Double Controlled NOT
  DCNOT ← ↯4_4 [1 0 0 0
                0 0 1 0
                0 0 0 1
                0 1 0 0]
  # SWAP
  Swap ← ↯4_4 [1 0 0 0
               0 0 1 0
               0 1 0 0
               0 0 0 1]
  # Imaginary SWAP
  ImSwap ← ↯4_4 [1 0 0 0
                 0 0 i 0
                 0 i 0 0
                 0 0 0 1]
  # Fermionic SWAP
  FSwap ← ↯4_4 [1 0 0 0
                0 0 1 0
                0 1 0 0
                0 0 0 ¯1]
  # Square root SWAP
  SqSwap ← ↯4_4 [1_0_0_0
                 0_Math~RHCD_Math~LHCD_0
                 0_Math~LHCD_Math~RHCD_0
                 0_0_1_1]
  # Square root imaginary SWAP
  SqImSwap ← ↯4_4 [1_0_0_0
                   0_(Math~OvSqTwo 1)_(Math~OvSqTwo i)_0
                   0_(Math~OvSqTwo i)_(Math~OvSqTwo 1)_0
                   0_0_0_1]
  # Swap raised to the a-th power
  # Input: a-th power
  ---AthSwapm
    Prepare ↚ ∩(÷2+1)⊃¯∘ × i ∿
    AddZeros ↚ ⇌⊂ 0⇌⊂ 0
    OneVec ↚ 1_0_0_0
    Call ← ⊂ OneVec ⇌ ⊂ OneVec ⊂⇌. AddZeros ⊂ Prepare
  ---
  AthSwap ← ↯4_4 AthSwapm
  # Fredkin (Control SWAP)
  FRK ← ↯8_8 [1 0 0 0 0 0 0 0
              0 1 0 0 0 0 0 0
              0 0 1 0 0 0 0 0
              0 0 0 1 0 0 0 0
              0 0 0 0 1 0 0 0
              0 0 0 0 0 0 1 0
              0 0 0 0 0 1 0 0
              0 0 0 0 0 0 0 1]
  # Toffoli (Doubly-controlled NOT)
  TOF ← ↯8_8 [1 0 0 0 0 0 0 0
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
  ---GCTRm
    ID ← ↯ ⊂.:⊂ 1 × 0 ⇡.
    GetDim ← × 2+ ₙ2 ⧻
    ZerosMat ← ↯ : 0 ⊂.× 2 # ⊸⧻
    Call ← [¯2_¯2 ¯2_¯1 ¯1_¯1 ¯1_¯2] ID GetDim,
    # not finished yet
  ---
  GCTR ← GCTRm
---
# -----------------------------------------------------------
# Part III: Quantum circuits (Circ)
---Circ
  # New ground state register
  # Reg ← ↯⊂:1 ⟜⇡⟜(↯ : Sng~Qground ⊂ :2_1)
  Reg ← ⍉↯⊂2⟜(⊂↯⊂:1 ⟜⇡)⟜(↯ : □Sng~Qground ⊂ :1)
  # Obtain a subregister using qubit indices
  PickN ← ⊂⟜(⊡1⊡)
  PickNReorder ← :PickN:
  Subregister ← ∘ # ↯:⟜(⊂⊂ 1. ÷ 2 △)join PickNReorder ⟜(PickNReorder) # ⊂⟜(⊡1⊡)
  # Thread a set of Hilbert space entities into a larger Hilbert space entity
  # Thread a (filtered) register into a vector state
  # Thread a gate set into a single operation
  # Unthread a vector state and produce a new register
  # Build a table with the full binary representation of (2^n, 1) indices of an C^n vector
  # Map a qubit reordering into the tensor product row reordering
  # Apply a stage to a current vector state representing n qubits, with the given gates and
  # a stated gate-dependent reordering (reordering a C^2 vector is less expensive than the gates)
  # Replaces every occurance of 0 with ⍺ in ⍵. ⍺ must be of shape 1.
  # Replaces every instance of 0 in ⍵ with the identity matrix
---
# -----------------------------------------------------------
# Part IV: Show, or Representation of qubits
---Show
  # Show a quantum state
  # Input: quantum state
  ---Qm
    WhichSign ↚ ⨬("-")("+")
    GetSign ↚ ⊃(WhichSign Math~SignToBit Math~RealPart ⊢ ⇌)(⨬¯∘ ⊸(≥0 Math~RealPart))
    MixFormat ↚ $"(_) |0⟩ _ (_) |1⟩"
    Mix ↚ MixFormat⊃(⊢ Math~ScalarProduct Sng~Qground)(GetSign⊢ Math~ScalarProduct Sng~Qexcited)
    PureFormat ↚ ⊢ ⨬("|1⟩")("|0⟩")
    Pure ↚ PureFormat Math~RealPart ⊢
    PureOrMixture ↚ ⨬(Mix)(Pure)⊸Math~MixOrPure
    Call ← PureOrMixture # 
  ---
  Q ← Qm
  # Shows a  state as a classical bit or a mixture
  ---Bm
    PureFormat ↚ ⊢ ⨬("1")("0")
    Call ← ⨬("𝜑")(PureFormat Math~RealPart ⊢)⊸Math~MixOrPure
  ---
  B ← Bm
---
# -----------------------------------------------------------
# Show
---test
Regiii ← Circ~Reg 3
# Circ~Subregister Regiii 0 1
# Gates~GCTR 1 Gates~X
# Show~Q °□⊡1⊡1 Regiii
°□⊡1⊡1 Regiii
---
