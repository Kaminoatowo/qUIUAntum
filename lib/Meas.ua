#Experimental!
~ "Math.ua" ~ Normalize
---MeasHelperm
~ "Sng.ua" ~ Qground Qexcited
Single = .
All = ⍜◌(⇡ₙ2 ⧻)
SelectColumn = on(°⍉⊏) ⍜◌⍉
RandomChoice = /+ < ⚂ \+ join both(/+ⁿ 2) by⊃(⋅×:)(⋅×) ¬.
SplitTensor =  resh join 2 div 2 bylen join not.
SelectLevel = ⨬(Qground)(Qexcited)
Call =  ⍜◌(SelectLevel underpopmul on⊏:⊃(SplitTensor)(RandomChoice)) SelectColumn pop ⨬(Single)(All) by(match ∞)
---
MeasHelper = MeasHelperm
---Measurem
~ "Circ.ua" ~ TensorIndex
NumQubits   ← ₙ2 ⧻
Indices       ← ⇡ ⧻
BinBasis = TensorIndex NumQubits
Call =  MeasHelper by(underpop(fork(Indices)(BinBasis)))
---
Measure = join⍜◌(box Normalize) boxjoin ∩□ Measurem