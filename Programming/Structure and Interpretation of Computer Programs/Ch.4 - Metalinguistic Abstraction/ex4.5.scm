Exercise 4.5. Scheme allows an additional syntax for cond clauses, (<test> => <recipient>). If
<test> evaluates to a true value, then <recipient> is evaluated. Its value must be a procedure of one
argument; this procedure is then invoked on the value of the <test>, and the result is returned as the value
of the cond expression. For example(cond ((assoc 'b '((a 1) (b 2))) => cadr)
(else false))
returns 2. Modify the handling of cond so that it supports this extended syntax.

>> bascialy we need to pass the  trigger the consequent procedure with the returned value of predicate.

(define (arrow-in-clause clause)
  (eq? (cadr clause) '=>)
)

(define (make-if predicate consequent alternative)
  (if (arrow-in-clause predicate)
    (list 'if predicate (consequent (predicate)) alternative)
    (list 'if predicate consequent alternative)))
    
