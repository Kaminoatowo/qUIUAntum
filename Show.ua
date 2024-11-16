~ "Math.ua" ~ Math
~ "Sng.ua" ~ Sng
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
  # Represent a register without expanding superposition or entanglement
  # Input: register
  R ← ⍚(
    B °□ ⊡1
  )
  # Represent in-register qubits
  # Input: register
  RIn ← ⍚(
    Q °□ ⊡1
  )
---
