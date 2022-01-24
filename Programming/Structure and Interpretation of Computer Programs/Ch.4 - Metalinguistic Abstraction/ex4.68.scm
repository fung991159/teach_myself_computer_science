Exercise 4.68: Define rules to implement the reverse op-
eration of Exercise 2.18, which returns a list containing the
same elements as a given list in reverse order. (Hint: Use
append-to-form.) Can your rules answer both (reverse
(1 2 3) ?x) and (reverse ?x (1 2 3)) ?

>> revise the "append-to-form" a bit to cater for reversing a list
(rule (append-to-form-reverse () () ()))
(rule (append-to-form-reverse (?u . ?v) (?v . ?z))
      (append-to-form-reverse ?v ?z)

>> here is first few steps of how the interpretor runs
?u: (a b c)
?v: d
?z: (d . ?z1)

?u: (a b)
?v: c
?z: (d . (c . ?z2))

?u: (a)
?v: b
?z: (d . (c . (b . ?z3)))