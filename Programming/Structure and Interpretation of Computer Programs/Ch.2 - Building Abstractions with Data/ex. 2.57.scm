; Exercise 2.57. Extend the differentiation program to handle sums and products of arbitrary numbers of
; (two or more) terms. Then the last example above could be expressed as
; (deriv '(* x y (+ x 3)) 'x)
; Try to do this by changing only the representation for sums and products, without changing the deriv
; procedure at all. For example, the addend of a sum would be the first term, and the augend would be the
; sum of the rest of the terms.

; >> can't figure this question on my own, need to peek at the anser

; make-sum/ make-product is already recursive in nature
; because of deriv, so changing addend, augend to get a list of item instead of single
; item could solve the issue

; checking whether a third elemnt exist with cdddr is brilliant, I go down the 
; wrong path of try to get the length of the list, which is way harder
(define (binary-expression? e)
  (null? (cdddr e)))
  
; turn out only changign augend and multiplicand would do, both isn't huge change also
; I tried to change make-product/make-sum instead, which again is more complicated
(define (augend s) 
  (if (binary-expression? s)
    (caddr s)
    (cons '+ (cddr s))
  ) 
)

(define (multiplicand p) 
  (if (binary-expression? p)
    (caddr p)
    (cons '* (cddr p))
  )
)