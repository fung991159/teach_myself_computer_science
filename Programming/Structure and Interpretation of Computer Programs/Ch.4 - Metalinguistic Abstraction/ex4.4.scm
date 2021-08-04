Exercise 4.4. Recall the definitions of the special forms and and or from chapter 1:
●and: The expressions are evaluated from left to right. If any expression evaluates to false, false is
returned; any remaining expressions are not evaluated. If all the expressions evaluate to true
values, the value of the last expression is returned. If there are no expressions then true is returned.
●or: The expressions are evaluated from left to right. If any expression evaluates to a true value,
that value is returned; any remaining expressions are not evaluated. If all expressions evaluate to
false, or if there are no expressions, then false is returned.
Install and and or as new special forms for the evaluator by defining appropriate syntax procedures and
evaluation procedures eval-and and eval-or. Alternatively, show how to implement and and or as
derived expressions.

>> surprisingly the implementation of "and" and "or" is actually very similar

>> special form
((and? exp) (tagged-lists? exp 'and))
(define (and-lst) (cdr exp))
(define (first-predicate and-lst) (car and-lst))
(define (rest-predicate and-lst) (cdr and-lst))
(define (no-predicate? and-lst) (null? and-lst))

(define (eval-and exps env)
  (cond ((no-predicate? exps) #t))
        ((not (true? (eval (first-predicate exps)))) #f)
        (else (eval-and (rest-predicate exps) env)))

((or? exp) (tagged-lists? exp 'or))
(define (eval-or exps env)
  (cond ((no-predicate? exps) #f))
        ((true? (eval (first-predicate exps))) #t)
        (else (eval-or (rest-predicate exps) env)))

>> dervied expression, basically it is just break down of the cond
and use nested-if instead
(define (eval-and exps env)
  (if (no-predicate? exps)
      #t
      (if (not (true? (eval (first-predicate exps))))
          #f
          (eval-and (rest-predicate exps) env))))
