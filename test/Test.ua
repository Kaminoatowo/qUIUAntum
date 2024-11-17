---test
~ "Circ.ua"
~ "Gates.ua"
~ "Math.ua"
~ "Mlt.ua"
~ "Show.ua"
~ "Sng.ua"
---
#~ "../lib/Math.ua" ~ Math
#~ "../lib/Sng.ua" ~ Sng
#~ "../lib/Gates.ua" ~ Gates
#~ "../lib/Circ.ua" ~ Circ
#~ "../lib/Show.ua" ~ Show
#~ "../lib/Mlt.ua" ~ Mlt
#---test
#Regiii ← Circ~Reg 3
#State ← Sng~Qsuper 0.5 0.5
# Mlt~Valid State
# Math~Dagger State
# ⍉ Math~Dagger State
# Circ~ThreadReg Regiii
#---