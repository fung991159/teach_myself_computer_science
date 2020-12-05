; Exercise 2.56. Show how to extend the basic differentiator to handle more kinds of expressions. For
; instance, implement the differentiation rule
; by adding a new clause to the deriv program and defining appropriate procedures exponentiation?,
; base, exponent, and make-exponentiation. (You may use the symbol ** to denote
; exponentiation.) Build in the rules that anything raised to the power 0 is 1 and anything raised to the power
; 1 is the thing itself.

; get the constructor, selector, expt maker right
; but don't quite get deriv part since the formula is so complicated lol

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (make-product (exponent exp)
                         (make-exponentiation (base exp)
                                              (make-sum (exponent exp) -1)))
           (deriv (base exp) var)))
          )
        )
        (else
         (error "unknown expression type - DERIV" exp))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base e) (cadr e))
(define (exponent e) (caddr e))
(define (make-exponentiation b e)
  (cond
    ((=number? e 0) 1)
    ((=number? e 1) b)
    ((and (number? b) (number? e) (expt b e)))
    (else (list '** b e))
  )
)