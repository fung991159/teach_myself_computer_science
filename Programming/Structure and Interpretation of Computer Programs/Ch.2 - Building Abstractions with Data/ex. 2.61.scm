; Exercise 2.61. Give an implementation of adjoin-set using the ordered representation. By analogy
; with element-of-set? show how to take advantage of the ordering to produce a procedure that
; requires on the average about half as many steps as with the unordered representation.

; >> so far so good, adjoin-set will stop 
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= (car set) x) set)
        ((> (car set) x) (cons x set))
        ((< (car set) x) (cons (car set) (adjoin-set x (cdr set)))
  )
))


