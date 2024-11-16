~ "Math.ua" ~ Math
~ "Sng.ua" ~ Sng
~ "Gates.ua" ~ Gates
~ "Circ.ua" ~ Circ
~ "Show.ua" ~ Show
~ "Mlt.ua" ~ Mlt
---test
Regiii ← Circ~Reg 3
State ← Sng~Qsuper 0.5 0.5
# Mlt~Valid State
# Math~Dagger State
# ⍉ Math~Dagger State
# Circ~ThreadReg Regiii
---
