~ "Math.ua" 
~ SignToBit
~ RealPart
~ ScalarProduct
~ MixOrPure
~ "Sng.ua"
~ Qground
~ Qexcited
  # Show a quantum state
  # Input: quantum state
  ---Qm
    WhichSign ↚ ⨬("-")("+")
    GetSign ↚ ⊃(WhichSign SignToBit RealPart ⊢ ⇌)(⨬¯∘ ⊸(≥0 RealPart))
    MixFormat ↚ $"(_) |0⟩ _ (_) |1⟩"
    Mix ↚ MixFormat⊃(⊢ ScalarProduct Qground)(GetSign⊢ ScalarProduct Qexcited)
    PureFormat ↚ ⊢ ⨬("|1⟩")("|0⟩")
    Pure ↚ PureFormat RealPart ⊢
    PureOrMixture ↚ ⨬(Mix)(Pure)⊸MixOrPure
    Call ← PureOrMixture # 
  ---
  Q ← Qm
  # Shows a  state as a classical bit or a mixture
  ---Bm
    PureFormat ↚ ⊢ ⨬("1")("0")
    Call ← ⨬("𝜑")(PureFormat RealPart ⊢)⊸MixOrPure
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

