Exercise 2.80. Define a generic predicate =zero? that tests if its argument is zero, and install it in the
generic arithmetic package. This operation should work for ordinary numbers, rational numbers, and
complex numbers.

>> this is very similar to 2.79

(define (install-scheme-number-package)

  (define (=zero? x) (if (= x 0)))

  (put '=zero? '(scheme-number) =zero?)
  …
  'done)

(define (install-rational-package)
  ;; internal procedures
  …
  (define (=zero? x) (if (= (numer x) 0)))
  …
  ;; interface to rest of the system
  …
  (put '=zero? '(rational) =zero?)
  …
  'done)

(define (install-complex-package)
  ;; imported procedures from rectangular and polar packages
  …
  ;; internal procedures
  …
  (define (=zero? x)
    (if
      (or  
        (= (complex-real-part x) 0)
        (= (complex-imag-part x) 0)
      )
  …
  ;; interface to rest of the system
  …
  (put '=zero? '(complex) =zero?)
  …
  'done)