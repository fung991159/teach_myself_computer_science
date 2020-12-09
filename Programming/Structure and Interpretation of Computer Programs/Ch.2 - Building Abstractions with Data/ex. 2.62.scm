; Exercise 2.62: Give a Θ(n) implementation of union-set for 
; sets represented as ordered lists.

; not too bad, this is a slight variatoin of intersection-set, 
; an else clause has been add since we need to cater for when x1 != x2,
; which is where both value need to be taken from both set

(define (union-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (union-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (union-set (cdr set1) set2))
              ((< x2 x1)
               (union-set set1 (cdr set2)))
              (else (cons 
                      (cons x1 x2) 
                      (union-set 
                        (cdr set1) 
                        (cdr set2)))
        ))))
)

