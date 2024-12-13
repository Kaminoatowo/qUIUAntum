# TODO for the dev branch

## Import uiua-math module

There is the [uiua-math](https://github.com/Omnikar/uiua-math) ([website](https://omnikar.github.io/uiua-math/)) module by [Omnikar](https://github.com/Omnikar) where there are many mathematical functions already implemented in UIUA and may turn out to be more efficient than functions I may implement myself

## Complete tests

- Modules
[X] Tests on Sng complete
[X] Tests on Math complete
[X] Tests on Mlt complete
[X] Tests on Gates complete
[X] Tests on Circ complete
[ ] Tests on Show complete (no tests for the moment)

- Algorithms
[ ] BV
[ ] DJ
[ ] QFT

# Bugs
- Only single qubit measurements -> Multiple qubits measurement --> There is a way to do that:
-   First measure: Measure 0 Stage ThreadReg Reg 3 0_2 H_H
-   Following measure: ⍜⊣(Measure 2 °□) (one at a time)