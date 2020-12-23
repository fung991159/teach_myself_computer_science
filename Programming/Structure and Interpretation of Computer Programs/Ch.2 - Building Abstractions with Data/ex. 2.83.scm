Exercise 2.83. Suppose you are designing a generic arithmetic system for dealing with the tower of types
shown in figure 2.25: integer, rational, real, complex. For each type (except complex), design a procedure
that raises objects of that type one level in the tower. Show how to install a generic raise operation that
will work for each type (except complex).



integer > rational > real > complex

;; add to (install-scheme-number-package)
(define (make-rat n d)
    (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(define (raises x)
    (make-rat x 1)
)
(put 'raise 'scheme-number raises)

;; add to (install-rational-package)
(define (rational->real x) (make-real (/ (numer x) (denom x))))
(put 'raise  'rational rational->real)

;; add to (install-real-package)
;; imported procedures from rectangular
(define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
(define (raises x)
    (make-from-real-imag x 0)
)
(put 'raise 'rational raises)

; Then when the system is
; required to operate on objects of different types
; it can successively raise the lower types until all the
; objects are at the same level in the tower
; >> I can't figure out this aprt, the immediate problem is
; >> how to determine the current tag is at which level,
; >> so we need to compare the two args and see which has the lower
; >> level and raise it accordingly. and repeat this step for arguments
; >> it is pretty headache problem tbh.