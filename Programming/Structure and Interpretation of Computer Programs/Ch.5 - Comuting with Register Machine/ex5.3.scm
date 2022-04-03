Exercise 5.3: Design a machine to compute square roots
using Newton's method, as described in Section 1.1.7:

Figure 5.5: Data paths and controller for the elaborated
GCS machine.

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


Begin by assuming that good-enough? and improve opera-
tions are available as primitives. Then show how to expand
these in terms of arithmetic operations. Describe each ver-
sion of the sqrt machine design by drawing a data-path
diagram and writing a controller definition in the register-
machine language.

>> Datapath see ex5.3.png
good-enough? / improve are primitives
(controller
  test-guess
    (test (op good-enough?) guess)
    (branch (label sqrt-done)
  sqrt-iter
    (assign improved-guess (op improve) guess)
    (goto (label test-guess))
  sqrt-done)
)


expand good-enough? / improve as arithmetic operations
(controller
  good-enough?
    (assign sq-guess (op square) (reg guess))
    (assign sq-guess-minus-x (op -) (reg sq-guess) (reg x))
    (assign abs-val (op abs) (reg sq-guess-minus-x))
    (test (op <) (const 0.001) (reg abs-val))
    (goto (label sqrt-done))
  improve
    (assign x-div-guess (op /) (reg x) (reg guess))
    (assign (reg t) (op average) (reg guess) (reg x-div-guess))
    (assign (reg guess) (reg t))
    (goto (label good-enough?))
  sqrt-done)