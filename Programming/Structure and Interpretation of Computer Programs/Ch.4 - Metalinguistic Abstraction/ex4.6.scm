; Exercise 4.6. Let expressions are derived expressions, because
; (let ((<var1> <exp1>) ... (<varn> <expn>))
; <body>)
; is equivalent to
; ((lambda (<var1> ... <varn>)
; <body>)
; <exp1>
; <expn>)
; Implement a syntactic transformation let->combination that reduces evaluating let expressions to
; evaluating combinations of the type shown above, and add the appropriate clause to eval to handle let
; expressions.

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