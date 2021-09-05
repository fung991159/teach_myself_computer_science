Exercise 4.22. Extend the evaluator in this section to support the special form let

>> the lambda can be analyze and make for once and to be used many time in excution, hence there is significat efficiency gain


(define (let-initials exp)
  (map cadr (cadr exp)))
(define (let-parameters exp)
  (map car (cadr exp)))
(define (let-body exp)
  (cddr exp))

(define (let->combination exp)
  (cons (make-lambda (let-parameters exp)
                     (let-body exp))
        (let-initials exp)))


>> add this in to "analyze"
((let? exp) (analyze-let exp))

(define (analyze-let exp)
  (lambda (env)
    (let->combination exp)))
