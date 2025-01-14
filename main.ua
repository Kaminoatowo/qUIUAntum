# Experimental!
┌─╴test
  # ~ "test/Test.ua"
└─╴
┌─╴debug
  ~ "lib/Circ.ua" ~ Stage
  ~ "lib/Gates.ua" ~ H
  ~ "lib/Meas.ua" ~ MeasureFun!
  VectorState ← ↯8_1 1_0_0_0_0_0_0_0
  # Call        ← ⊃(Stage)(StageII) VectorState 1 H
  # Call ← StageII VectorState 1 H
  # Call ← ⊃(Measure)(MeasureII) 1_2 Stage VectorState 1_2 H_H
  VectorCirc ← Stage VectorState 1_2 H_H
  Call       ← MeasureFun!2 1_2 VectorCirc
└─╴
debug
