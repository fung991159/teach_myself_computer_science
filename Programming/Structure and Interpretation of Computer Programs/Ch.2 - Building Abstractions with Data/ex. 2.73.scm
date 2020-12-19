(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else (error "unknown expression type -- DERIV" exp))))


; We can regard this program as performing a dispatch on the type of the expression to be differentiated. In this situation the "type tag" of the datum is the algebraic operator symbol (such as +) and the operation being performed is deriv. We can transform this program into data-directed style by rewriting the basic derivative procedure as

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
; a. Explain what was done above. Why can't we assimilate the predicates number? and same-variable? into the data-directed dispatch?
; >> if exp is not a number or same expression as var, then deriv will fetch the operator using exp and run on operands expression with var,
; it should work just the same as the old version. 
; the reason the two predicate cannot be assimilate into the dispatch is we need a base case to end deriv.

; b. Write the procedures for derivatives of sums and products, and the auxiliary code required to install them in the table used by the program above.
(define (install-sum-package)
    (define (addend s) (cadr s))
    (define (augend s) (caddr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (deriv-sum exp var)
    (make-sum (deriv-sum (addend exp) var)
              (deriv-sum (augend exp) var))
  (put 'deriv '+ deriv-sum)
)

(define (install-product-package)
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (deriv-product exp var)
    (make-sum
      (make-product (multiplier exp)
                    (deriv-product (multiplicand exp) var))
      (make-product (deriv-product (multiplier exp) var)
                    (multiplicand exp))))
  (put 'deriv '* deriv-product)
)

; c. Choose any additional differentiation rule that you like, such as the -one for exponents (Exercise 2-56), and install it in this data-directed system.
(define (install-exponentiation-package)
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (deriv-exponentiation exp var)
    (make-sum
      (make-product (multiplier exp)
                    (deriv-exponentiation (multiplicand exp) var))
      (make-product (deriv-exponentiation (multiplier exp) var)
                    (multiplicand exp))))
  (put 'deriv '** deriv-exponentiation)
)

; d. In this simple algebraic manipulator the type of an expression is the algebraic operator that binds it together.
; Suppose, however, we indexed the procedures in the opposite way, so that the dispatch line in deriv looked like
; ((get (operator exp) 'deriv) (operands exp) var)
; What corresponding changes to the derivative system are required?

;>> basically it is reversing the "op" and "type", which is the x and y of the mapping table,
;>> when we install the package, we need to "put" according to the new way (with op/tyep swapped)