# Experimental!
┌─╴test
  ~ "test/Test.ua"
└─╴
┌─╴debug
└─╴
~ "lib/Circ.ua" ~ Reg Stage ThreadReg
~ "lib/Gates.ua" ~ CNOT H I
~ "lib/Meas.ua" ~ Measure
VectorState  ← ThreadReg Reg 3
ResultVector ← Stage VectorState 2 H
# Measure ∞ Stage ThreadReg Reg 3 0_2 H_H
Measure 0 Stage ThreadReg Reg 3 0_2 H_H
# ⊂⊃(⊏ 0)(Measure 0 °□⊣)
# Measure 0 ⊸(°□⊣)
# ⍜⊣(Measure 2 °□)
# ⍜⊣(Measure 0 °□)
# ⍜⊣(Measure 1 °□)
