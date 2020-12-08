; Exercise 2.60: We specified that a set would be represented as a list with no duplicates. 
; Now suppose we allow duplicates. For instance, the set {1,2,3} could be represented as the list (2 3 2 1 3 2 2).
; Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on this representation. 
; How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation? 
; Are there applications for which you would use this representation in preference to the non-duplicate one?

; no change
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

; removed element-of-set? predicate
(define (adjoin-set x set)
      (cons x set))

; no change
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; removed element-of-set? predicate
(define (union-set set1 set2)
    (cond 
      ((null? set1) set2) 
      ((null? set2) set1)
      (else (cons (car set1)
            (union-set (cdr set1) set2)))))


; intersectino-set, union-set will have element-of-set? predicate take out,
; essentially making the operations as list operation instead of set
; it will actually run faster without the predicate.

; element-of-set? and intersection-set will be way slower since now the set/list is 
; much longer than before with duplciate

