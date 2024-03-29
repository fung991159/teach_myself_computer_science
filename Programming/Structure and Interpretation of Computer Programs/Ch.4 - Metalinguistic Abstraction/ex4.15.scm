Exercise 4.15. Given a one-argument procedure p and an object a, p is said to ``halt'' on a if evaluating
the expression (p a) returns a value (as opposed to terminating with an error message or running
forever). Show that it is impossible to write a procedure halts? that correctly determines whether p halts
on a for any procedure p and object a. Use the following reasoning: If you had such a procedure halts?,
you could implement the following program:
(define (run-forever) (run-forever))
(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))
Now consider evaluating the expression (try try) and show that any possible outcome (either halting
or running forever) violates the intended behavior of halts?.23


>>(try try) means if it can halts itself (true condition), it will run-forever. Which is contradcitory condition. if it cannto halt itself (false condition), it will be forever running the check and not return value "halted".

so it is impossible to implemnt "halts?"