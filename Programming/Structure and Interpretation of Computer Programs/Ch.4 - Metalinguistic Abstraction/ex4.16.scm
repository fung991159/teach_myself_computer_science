Exercise 4.16. In this exercise we implement the method just described for interpreting internal
definitions. We assume that the evaluator supports let (see exercise 4.6).
a. Change lookup-variable-value (section 4.1.3) to signal an error if the value it finds is the symbol *unassigned*.

 (define (lookup-variable-value var env)
     (define (env-loop env)
         (define (scan vars vals)
             (cond ((null? vars) (env-loop (enclosing-environment env)))
                   ((eq? var (car vars))
                    (if (eq? '*unassigned* (car vals))
                        (error "unassigned variable" var)
                        (car vals)))
                   (else (scan (cdr vars) (cdr vals)))))
         (if (eq? env the-empty-environment)
             (error "Unbound variable" var)
             (let ((frame (first-frame env)))
                 (scan (frame-variables frame)
                       (frame-values frame)))))
     (env-loop env))


b. Write a procedure scan-out-defines that takes a procedure body and returns an equivalent one
that has no internal definitions, by making the transformation described above.

>> this is a lot of effort to complete this, skipping it!

c. Install scan-out-defines in the interpreter, either in make-procedure or in procedure-
body (see section 4.1.3). Which place is better? Why?

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

>> install in make-precedure we will have the transformed body for used in the rest of the code, while installing it in "procedure-body" the transformed body is generated on selection run-time. It depends if we have dynamic component within the body.


