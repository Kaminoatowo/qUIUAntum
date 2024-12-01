~ "Math.ua"
~ Normalize
~ ScalarProduct
  # Ground state |0>
  Qground ← ↯2_1 1_0
  # Excited state |1>
  Qexcited ← ↯2_1 0_1
  # Superposition starter
  Qstarter ← Qground_Qexcited
  # Linear superposition of amplitudes
  # Input: the relative amplitudes for the G and E states
  # Qsuper ← Normalize ScalarProduct Qstarter ⊂
  Qsuper ← Normalize + ⊓(× Qground)(× Qexcited)
  # Bloch state
  # Input: Bloch angles, in order theta and phi
  # theta in [0, π]
  # phi in [0, τ]
  Bloch ← ScalarProduct Qstarter ×⊂1ℂ⊃∿(∿+η):⊂⊃(∿+η)∿÷2
  # Projector operator to 0
  Pground ← ↯2_2 1_0_0_0
  # Projector operator to 1
  Pexcited ← ↯2_2 0_0_0_1

