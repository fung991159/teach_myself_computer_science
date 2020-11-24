; Exercise 2.41. Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than
; or equal to a given integer n that sum to a given integer s.

; don't quite get how the nested mapping part work
; in peusdo it is quite straight forward, find the triple positive integers by nested mapping
; then check if the accumulate of this 3 integer is equal to "s" with a filter
; the end result would be a list of lis tthat satisfy the condition

(define (triples-that-sum-to s n)
  (define (sum-to-s? triple)
    (= s (+ (car triple) (cadr triple) (caddr triple))))
  (define (unique-triples n)
    (flatmap (lambda (i)
               (flatmap (lambda (j)
                          (map (lambda (k) (list i j k))
                               (enumerate-interval 1 (- j 1))))
                        (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))
  (filter sum-to-s? (unique-triples n)))