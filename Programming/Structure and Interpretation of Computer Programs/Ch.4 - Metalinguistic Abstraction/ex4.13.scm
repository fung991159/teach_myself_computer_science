Exercise 4.13. Scheme allows us to create new bindings for variables by means of define, but provides
no way to get rid of bindings. Implement for the evaluator a special form make-unbound! that removes
the binding of a given symbol from the environment in which the make-unbound! expression is
evaluated. This problem is not completely specified. For example, should we remove only the binding in
the first frame of the environment? Complete the specification and justify any choices you make.

>> unbound should remove the binding in all frame, as removing the first frame will only make the variable "free", i.e. refer to the value in enclosing env if it exist. Effectively make the variable non static.

>> it seems there is no way to undefine a varialbe in scheme. so the next alternative just reset the var to undefined varialbe string.

(define (make-unbound! object env)

(define (make-unbound! var env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((eq? var (car vars))
              (set-car! vals "UNDEFINED VARIALBE!"))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))
