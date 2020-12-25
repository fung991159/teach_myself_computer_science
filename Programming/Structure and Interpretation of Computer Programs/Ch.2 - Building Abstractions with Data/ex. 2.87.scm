Exercise 2.87. Install =zero? for polynomials in the generic arithmetic package. This will allow
adjoin-term to work for polynomials with coefficients that are themselves polynomials.

x**100 + 2x**2 + 1
((100 1) (2 2) (0 1))

;; ! can't work this one out, so peeked from the solution

(define (install-polynomial-package)
  …
  (define (=zero-all-terms? L)
    (cond ((empty-termlist? L) #t)
          ((not (=zero? (coeff (first-term L)))) #f)
          (else (=zero-all-terms? (rest-terms L)))))
  (define (=zero-poly? p)
    (=zero-all-terms? (term-list p)))
  (put '=zero? '(polynomial) =zero-poly?)



