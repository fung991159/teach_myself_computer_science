Exercise 4.40: In the multiple dwelling problem, how many
sets of assignments are there of people to floors, both be-
fore and after the requirement that floor assignments be
distinct? It is very inefficient to generate all possible assign-
ments of people to floors and then leave it to backtracking
to eliminate them. For example, most of the restrictions de-
pend on only one or two of the person-floor variables, and
can thus be imposed before floors have been selected for
all the people. Write and demonstrate a much more effi-
cient nondeterministic procedure that solves this problem
based upon generating only those possibilities that are not
already ruled out by previous restrictions. (Hint: This will
require a nest of let expressions.)

>> my attempt, basically we don't need to do "amb" on all floor for everyone since logically we can already remove certain possibilities. Another point is to make use of nested "let" to make the process keep state the value of previously passed logic

(define (multiple-dwelling)
  (let ((cooper (amb 2 3 4)))
       ((miller (amb 3 4 5)))
          (require (> miller cooper))
            (let ((fletcher (amb 2 3 4)))
              (require (not (= (abs (- fletcher cooper)) 1)))
                (let ((smith (amb 1 2 3 4 5)))
                    (require (not (= (abs (- smith fletcher)) 1)))
                    (let ((baker (amb 1 2 3 4)))
                      (require
                        (distinct? (list baker cooper fletcher miller smith))
                      )
                    )
                ) 
            )
  (list (list 'baker baker)       (list 'cooper cooper)
        (list 'fletcher fletcher) (list 'miller miller)
        (list 'smith smith))))