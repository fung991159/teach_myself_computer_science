Exercise 3.33. Using primitive multiplier, adder, and constant constraints,
define a procedure averager
that takes three connectors a, b, and c as inputs and establishes the
constraint that the value of c is the
average of the values of a and b.

>> a + b = 2c

(define (averager a b c)
  (let ((summed (make-connector)
        (cst (make-connector)))
  (constant 2 cst)
  (adder a b summed)
  (multipler cst c summed)
)