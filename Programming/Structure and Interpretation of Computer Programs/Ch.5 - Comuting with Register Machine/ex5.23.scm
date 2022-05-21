Exercise 5.23: Extend the evaluator to handle derived ex-
pressions such as cond, let, and so on (Section 4.1.2). You
may “cheat” and assume that the syntax transformers such
as cond->if are available as machine operations.

>> since cond->if is available, we just need to reroute it

eval-dispatch
  ...
  (test (op cond?) (reg exp))
  (branch (label ev-cond))

ev-cond
  (assign exp (op cond->if) (reg exp))
  (goto (label ev-if))  ; evaluate the predicate 
