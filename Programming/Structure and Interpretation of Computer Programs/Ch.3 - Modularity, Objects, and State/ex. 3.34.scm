Exercise 3.34. Louis Reasoner wants to build a squarer, a constraint device
with two terminals such that
the value of connector b on the second terminal will always be the square of
the value a on the first
terminal. He proposes the following simple device made from a multiplier:
(define (squarer a b)
  (multiplier a a b))
There is a serious flaw in this idea. Explain.

>> squarer can go compute b with squared from a,
but not a with the square root of b. The logic 
of multiplier doesn't cater for this.