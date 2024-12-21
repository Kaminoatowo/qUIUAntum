# Experimental!
┌─╴test
  ~ "test/Test.ua"
└─╴
┌─╴debug
  ~ "lib/Circ.ua" ~ Reg ThreadReg
  ~ "lib/Mlt.ua" ~ UnKPr
  State  ← Reg 3
  TState ← ThreadReg State
  Call   ← UnKPr ↯ 4_1 [0.5 0.5 0.5 0.5]
└─╴
debug
