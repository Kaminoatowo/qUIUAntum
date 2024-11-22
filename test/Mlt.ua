~ "../lib/Mlt.ua" ~ Mlt
---UnKroneckerProduct
Sqrt =~ ⁿ ÷ 2 1 ÷ 2 1
A   ↚ ↯2_1 Sqrt_Sqrt
Try = Mlt~UnKroneckerProduct ↯ 4_1 [0.5 0.5 0.5 0.5]
Correct = ↯ 2_1 Sqrt_Sqrt
Msg = "Testing the decomposition of an equal superposition in every state"
---
---test
 ⍤⟜≍: UnKroneckerProduct~Correct UnKroneckerProduct~Try
---