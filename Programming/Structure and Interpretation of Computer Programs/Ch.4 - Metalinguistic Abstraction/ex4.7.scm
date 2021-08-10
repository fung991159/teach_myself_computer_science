; Exercise 4.7. Let* is similar to let, except that the bindings of the let variables are performed
; sequentially from left to right, and each binding is made in an environment in which all of the preceding
; bindings are visible. For example
;   (let* ((x 3)
;         (y (+ x 2))
;         (z (+ x y 5)))
;     (* x z))
; returns 39. Explain how a let* expression can be rewritten as a set of nested let expressions, and write
; a procedure let*->nested-lets that performs this transformation. If we have already implemented
; let (exercise 4.6) and we want to extend the evaluator to handle let*, is it sufficient to add a clause to
; eval whose action is
; (eval (let*->nested-lets exp) env)
; or must we explicitly expand let* in terms of non-derived expressions?

>> this is from internet

 (define (let*-body expr) (caddr expr)) 
 (define (let*-inits expr) (cadr expr)) 
 (define (let*->nested-lets expr) 
         (let ((inits (let*-inits expr)) 
                   (body (let*-body expr))) 
                 (define (make-lets exprs) 
                         (if (null? exprs) 
                                 body 
                                 (list 'let (list (car exprs)) (make-lets (cdr exprs))))) 
                 (make-lets inits)))

>> my attempt was a a little bit off

; (define (let*->nested-lets exp)
;   (let  ((let-part (cadr exp)))
;          (let-body (caddr exp))
;     (define (iter let-exp)
;         (let ((let-first (car let-exp))
;               (let-rest (cdr let-exp)))
;           (if (not (null? let-rest))
;             (cons (list 'let (list let-first))
;                   (iter let-rest))
;                   (list (list 'let let-first)))));(list 'let let-first)
;     (iter let-part)))
