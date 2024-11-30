~ "Sng.ua" ~ Sng
~ "Math.ua" ~ Math
┌─╴Circ
  ~ "Mlt.ua" ~ Mlt
  # Replace element in given position of given boxed array with given element
  # Input: index 
  #        element
  #        array
  Replace‼! ← ⍜(⊡ ^0|⊂ □ ^0 ^1 ◌) ^2
  ArrayReg  ← ∵°□≡⊏ 1
  # New ground state register
  # Input: number of qubits
  Reg ← ⍉↯⊂2⟜(⊂↯⊂:1 ⟜⇡)⟜(↯ : □Sng~Qground ⊂ :1)
  # Obtain a subregister using qubit indices
  # Input: qubit indices
  #        register
  Subregister ← ⊏
  # Thread a set of Hilbert space entities into a larger Hilbert space entity
  # Input: Number of qubits - 1
  #        Qubits
  Thread! ← ⍥(Math~KroneckerProduct) ^0
  # Thread a (filtered) register into a vector state
  # Input: register
  ThreadReg ← /Math~KroneckerProduct ArrayReg
  # Thread a gate set into a single operation
  # Input: gate set
  ThreadGate! ← ⍥(Math~KroneckerProduct) ^0
  # Unthread a vector state and produce a new register
  # Input: vector state (register)
  ┌─╴Unthreadm
    NumQubits ← ₙ 2 ⧻
    RangeNum  ← ↯ ⊂ :1 ⟜(∵□ ⇡) NumQubits
    Call      ← Mlt~UnKroneckerProduct ⟜RangeNum
  └─╴
  Unthread ← ∵⊂ : Unthreadm
  # Build a table with the full binary representation of (2^n, 1) indices of an C^n vector
  # Map a qubit reordering into the tensor product row reordering
  # Apply a stage to a current vector state representing n qubits, with the given gates and
  # a stated gate-dependent reordering (reordering a C^2 vector is less expensive than the gates)
  # Replaces every occurance of 0 with ⍺ in ⍵. ⍺ must be of shape 1.
  # Replaces every instance of 0 in ⍵ with the identity matrix
└─╴
