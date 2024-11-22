# Experimental!
┌─╴test
  # ~ "test/Test.ua"
└─╴
┌─╴debug
  ~ "lib/Circ.ua" ~ Circ
  ~ "lib/Math.ua" ~ Math
  ~ "lib/Mlt.ua" ~ Mlt
  # Reg    ← Circ~Reg 1
  Return ← Mlt~UnKroneckerProduct ↯ 4_1 [0.5 0 0.5 0]
└─╴
debug~Return
# ↯ 4_1 [0.5 0.5 0.5 0]
↯ ⊂ :1 ⟜(∵□ ⇡) 2
