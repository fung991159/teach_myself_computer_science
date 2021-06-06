Exercise 3.14: The following procedure is quite useful, although obscure:

(define (mystery x)
  (define (loop x y)
    (display x)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

loop uses the ``temporary'' variable temp to hold the old value of the cdr of x,
since the set-cdr! on the next line destroys the cdr. Explain what mystery does in general.
Suppose v is defined by (define v (list 'a 'b 'c 'd)). Draw the box-and-pointer diagram that
represents the list to which v is bound.
>> see ex3.14.png

Suppose that we now evaluate (define w (mystery v)).
Draw box-and-pointer diagrams that show the structures v and w after evaluating this expression.

What would be printed as the values of v and w?
>> w: (d c b a)
>> v: (a)

v only left with "a", because the first set-cdr cannot find any "x" in the env, so it go to global env and modified the "x" there.
subsequent set-cdr! are based on previous sub-env so the "v"
in global env is unaffected.

it is easier to understand to follow each iteration :)
iter 1
curr x:(a b c d)
curr y:()
new x:(a)
temp:(b c d)

iter 2
curr x:(b c d)
curr y:(a)
new x:(b a)
temp:(c d)

iter 3
curr x:(c d)
curr y:(b a)
new x:(c b a)
temp:(d)

iter 4
curr x:(d)
curr y:(c b a)
new x:(d c b a)
temp:()