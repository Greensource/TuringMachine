#TuringMachine Project

##Conception
###Objects

1. Tape
 
A tape is composed by cells. It is simulated as infinite left and right.
Each cell must be identified uniquely. A reading head can move forward or backawrd on the tape.
Each cell contain a symbol from a finite alphabet.

2. Cell

A cell contain a symbol from a finite alphabet.
It content can be read and write.

3. State

A State is just a Tag


4. Instruction Table

This object define transition beetween state. It is compound of multiple entry where each entry define a transition.

5. Transition Entry

A transition define a condition to pass from a state to another.
A transition contain an initial state and an array of double (symbol,state).


6. Alphabet

An alphabet is a finite set of Symbol

7. Symbol

A Symbol is the primitive data.
