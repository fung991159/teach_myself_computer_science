Exercise 4.19. Ben Bitdiddle, Alyssa P. Hacker, and Eva Lu Ator are arguing about the desired result of
evaluating the expression
(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))

; Ben's view
((lambda (a)
    (define (f x) ; x is 10
      (define b (+ a x)) ; a is not in local env, so search in enclosing env, where a = 1
      (define a 5) ; a rebounded to 5
      (+ a b))
    (f 10))
  1)

; Alyssa's view
((lambda (a)
  (lambda (x)
    (let ((b '*unassigned*)
          (a '*unassigned*'))
      (set! b (+ a x))
      (set! a 5)
      (+ a b)))
    10)
  1)

((lambda (a)
  (lambda (x)
    ((lambda (b a)
      (set! b (+ a x))
      (set! a 5)
      (+ a b))
      '*unassigned*
      '*unassigned*))
    10)
  1)


Ben asserts that the result should be obtained using the sequential rule for define: b is defined to be 11,
then a is defined to be 5, so the result is 16. Alyssa objects that mutual recursion requires the simultaneous
scope rule for internal procedure definitions, and that it is unreasonable to treat procedure names
differently from other names. Thus, she argues for the mechanism implemented in exercise 4.16. This
would lead to a being unassigned at the time that the value for b is to be computed. Hence, in Alyssa's
view the procedure should produce an error. Eva has a third opinion. She says that if the definitions of a
and b are truly meant to be simultaneous, then the value 5 for a should be used in evaluating b. Hence, in
Eva's view a should be 5, b should be 15, and the result should be 20. Which (if any) of these viewpoints
do you support? 

>> I think Alyssa's view is right, once again we are assigning string to a variable


Can you devise a way to implement internal definitions so that they behave as Eva
prefers?
>> in inner procedure, define a before b. That way variable a would not be free variable and have allocated value in local env.
