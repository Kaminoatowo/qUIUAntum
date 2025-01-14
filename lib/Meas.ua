#Experimental!
~ "Math.ua" ~ Normalize
~ "Sng.ua" ~ Qground Qexcited
~ "Circ.ua" ~ TensorIndex

OnVS ← ⍜◌(⊸⊃(⇡⧻)(TensorIndex ₙ2 ⧻))
Idx ← ⨬(∘)(⇡ₙ2⧻◌)≍[].
PreMeas      ← Idx OnVS
BasisSplit   ← ↯⊂2÷2⊸⧻⊂
RandomChoice ← /+<⚂\+⊂∩(/+ ⁿ2)⊃(⋅×:)(⋅×)
SelectColumn ← ⟜(°⍉⊏)⍜◌(⍉)
Helper       ← ⟜⊏:⊃(BasisSplit)(RandomChoice)¬.
SelectLevel  ← ⨬(Qground)(Qexcited)
Meas         ← ⍜◌(⊂□⍜◌(□SelectLevel ⍜◌(□Normalize ×⍜◌(⊸(°□⊣)))Helper)SelectColumn)
PostMeas     ← ⍜◌(⍜⊏◌0:□◇⊂□⊙⊸⊢⍜◌(⍜⇌(⍜⊏◌0):))
Measure      ← |3.2 PostMeas Meas ↘1⟜⊢ PreMeas
# Measure a vector state on given qubits
# Input: number of measured qubits
#        qubits
#        vector state
MeasureFun!  ← ◌◌⍥(⊙(°□⊸⊣) Measure)^0 ⊙⟜(⊂□[]□)
