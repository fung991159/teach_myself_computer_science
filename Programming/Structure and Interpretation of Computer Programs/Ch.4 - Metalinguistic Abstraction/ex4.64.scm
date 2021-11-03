Exercise 4.64: Louis Reasoner mistakenly deletes the outranked-
by rule (Section 4.4.1) from the data base. When he real-
izes this, he quickly reinstalls it. Unfortunately, he makes a
slight change in the rule, and types it in as

  (rule (outranked-by ?staff-person ?boss)
        (or (supervisor ?staff-person ?boss)
            (and (outranked-by ?middle-manager ?boss)
                  (supervisor ?staff-person
                              ?middle-manager))))

Just after Louis types this information into the system, De-
Witt Aull comes by to find out who outranks Ben Bitdiddle.
He issues the query
(outranked-by (Bitdiddle Ben) ?who)
After answering, the system goes into an infinite loop. Ex-
plain why.

>> ?staff-person is bound to (Bitdiddle Ben), ?boss is bound to ?who
in the and clause, the first predicate translated to "(outranked-by ?middle-manager ?who)", which will in turn bind the variable ?who to ?boss
forever
