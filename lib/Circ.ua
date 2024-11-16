~ "Sng.ua" ~ Sng
~ "Math.ua" ~ Math
---Circ
  ArrayReg ← ∵°□≡⊏ 1
  # New ground state register
  # Input: number of qubits
  Reg ← ⍉↯⊂2⟜(⊂↯⊂:1 ⟜⇡)⟜(↯ : □Sng~Qground ⊂ :1)
  # Obtain a subregister using qubit indices
  # Input: qubit indices
  #        register
  Subregister ← ⊏
  # Thread a set of Hilbert space entities into a larger Hilbert space entity
  # Thread a (filtered) register into a vector state
  # Input: register
  ThreadReg ← /Math~KroneckerProduct ArrayReg
  # Thread a gate set into a single operation
  # Unthread a vector state and produce a new register
  # Build a table with the full binary representation of (2^n, 1) indices of an C^n vector
  # Map a qubit reordering into the tensor product row reordering
  # Apply a stage to a current vector state representing n qubits, with the given gates and
  # a stated gate-dependent reordering (reordering a C^2 vector is less expensive than the gates)
  # Replaces every occurance of 0 with ⍺ in ⍵. ⍺ must be of shape 1.
  # Replaces every instance of 0 in ⍵ with the identity matrix
---
