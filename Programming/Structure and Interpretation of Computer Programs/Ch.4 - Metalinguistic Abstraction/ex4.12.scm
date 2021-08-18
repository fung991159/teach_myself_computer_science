Exercise 4.12. The procedures set-variable-value!, define-variable!, and lookup-
variable-value can be expressed in terms of more abstract procedures for traversing the environment
structure. Define abstractions that capture the common patterns and redefine the three procedures in terms
of these abstractions.

>> the only thing change is what the function need to do in response when the var is null in current frame and if we actually find the var and do some action with it.


(define (handle-variable var env action)
  (define (null-mapping action)
    (cond ((eq? action 'lookup) env-loop (enclosing-environment env))
          ((eq? action 'set) env-loop (enclosing-environment env))
          ((eq? action 'define) add-binding-to-frame!)
    ))
  (define (action-mapping action)
    (cond ((eq? action 'lookup) car)
          ((eq? action 'set) set-car!)
          ((eq? action 'define) set-car!)
    ))
  (define (env-loop env action)
    (define (scan vars vals)
      (cond ((null? vars)
              (null-mapping action))
            ((eq? var (car vars))
              (action-mapping action))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env action))
