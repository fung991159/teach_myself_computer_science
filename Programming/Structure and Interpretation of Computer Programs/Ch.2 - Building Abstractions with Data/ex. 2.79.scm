Exercise 2.79. Define a generic equality predicate equ? that tests the equality of two numbers, and install
it in the generic arithmetic package. This operation should work for ordinary numbers, rational numbers,
and complex numbers.

>> my attempt, but the question doesn't say the two incoming numbers is of which type?
>> if there is no tag then there is no sure way about which test to fire.

(define (equ? x y) (apply-generic 'equ? x y))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define (equ? num1 num2)
  (cond ((and (num? num1) (num? num2))  ;; normal number
          (eq? num1 num2)
            #t)
        ((equal-rat? num1 num2)  ;; rational number
          #t)
        ((and (= (real-part num1) (real-part num2))  ;; complex number
              (= (imag-part num1) (imag-part num2))
                #t))
        (else #f)
  )
)


! looks like my understanding of the question is a bit off, 
! install it in the generic arithmetic package doesn't mean install
! them all in one package like I did. Thougt my test is correct,
! just they should be reside in their respective package.

(define (install-scheme-number-package)
  …
  (put 'equ? '(scheme-number scheme-number) =)
  …
  'done)

(define (install-rational-package)
  ;; internal procedures
  …
  (define (equ? x y)
    (and (= (numer x) (numer y))
         (= (denom x) (denom y))))
  …
  ;; interface to rest of the system
  …
  (put 'equ? '(rational rational) equ?)
  …
  'done)

(define (install-complex-package)
  ;; imported procedures from rectangular and polar packages
  …
  ;; internal procedures
  …
  (define (equ? z1 z2)
    (and (= (complex-real-part z1) (complex-real-part z2))
         (= (complex-imag-part z1) (complex-imag-part z2))))
  …
  ;; interface to rest of the system
  …
  (put 'equ? '(complex complex) equ?)
  …
  'done)