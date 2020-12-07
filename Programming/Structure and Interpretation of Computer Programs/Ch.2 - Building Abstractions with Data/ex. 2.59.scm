; Exercise 2.59: Implement the union-set operation
; for the unordered-list representation of sets.

; >> it seems in among all programming task, searching for something in a list is almost the most important / key building block, 
; >> as shown here in element-of-set?
; >> turn out union-set is very much similar to intersect-set, a surprise for me.
; >> pretty easy
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
    (cond 
      ((null? set1) set2) 
      ((null? set2) set1)
      ((not (element-of-set? (car set1) set2))
        (cons (car set1)
              (union-set (cdr set1) set2)))
      (else (union-set (cdr set1) set2))))