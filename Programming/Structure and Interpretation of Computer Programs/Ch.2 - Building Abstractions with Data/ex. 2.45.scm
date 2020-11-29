; Exercise 2.45. Right-split and up-split can be expressed as instances of a general splitting
; operation. Define a procedure split with the property that evaluating
; (define right-split (split beside below))
; (define up-split (split below beside))
; produces procedures right-split and up-split with the same behaviors as the ones already defined.

; >> basic refactoring, nothing too hard
(define (split a b)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller (up-split painter (- n 1))))
            (a painter (b smaller smaller))))))
; !! can name the variable better, a should be identity, b should be smaller
(define (split identity-ops smaller-ops)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller (up-split painter (- n 1))))
            (identity-ops painter (smaller-ops smaller smaller))))))