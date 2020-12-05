; Exercise 2.54. Two lists are said to be equal? if they contain equal elements arranged in the same order.
; For example,
; (equal? '(this is a list) '(this is a list))
; is true, but
; (equal? '(this is a list) '(this (is a) list))
; is false. To be more precise, we can define equal? recursively in terms of the basic eq? equality of
; symbols by saying that a and b are equal? if they are both symbols and the symbols are eq?, or if they
; are both lists such that (car a) is equal? to (car b) and (cdr a) is equal? to (cdr b). Using
; this idea, implement equal? as a procedure.36

(define (equal? a b)
    ; (display "a val:'") (display a) (newline)
    ; (display "b val:'") (display b) (newline)
    (newline)
    (cond 
          ((or (null? a) (null? b)) #t) ; base case can be true as it is "and" operator 
          ; if both a b is symbol, simple equal 
          ((and (not (list? a)) (not (list? b)))
            (eq? a b))
          ; if both a b is list, then compare car and cdr is equal,
          ; using equal? not eq as list cannot be directly compared
          ((and (list? a) (list? b))
              (and     
                (equal? (car a) (car b))
                (equal? (cdr a) (cdr b))
            )
          )
          (else ; one is list, the other isn't
            #f
          )
    )   
)