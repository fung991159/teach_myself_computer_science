Exercise 2.88. Extend the polynomial system to include subtraction of polynomials. (Hint: You may find
it helpful to define a generic negation operation.)

;; just changing name from add-poly, this is the straight-forward solution.

(define (subtract-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                    (subtract-terms (term-list p1)
                                (term-list p2)))
        (error "Polys not in same var -- SUBTRACT-POLY"
                (list p1 p2))))
(define (subtract-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else
           (let ((t1 (first-term L1)) (t2 (first-term L2)))
             (cond ((> (order t1) (order t2))
                    (adjoin-term
                     t1 (subtract-terms (rest-terms L1) L2)))
                   ((< (order t1) (order t2))
                    (adjoin-term
                     t2 (subtract-terms L1 (rest-terms L2))))
                   (else
                    (adjoin-term
                     (make-term (order t1)
                                (subtract (coeff t1) (coeff t2)))
                     (subtract-terms (rest-terms L1)
                                     (rest-terms L2)))))))))


;; !the smart way is to use a negation procedure, since subtract is
;; just adding Term 1 to negative of Term 2


