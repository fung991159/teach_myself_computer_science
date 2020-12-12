; Exercise 2.65: Use the results of Exercise 2-63 and Exercise 2-64 to give Θ(n) implementations of
; union-set and intersection-set for sets implemented as (balanced) binary trees.41

; basically just call tree->list for the union-set operation before processing, and convert it back to tree afterward
; same for intersection-set

(define (union-set set1 set2) 
    (cond  ((null? set1) set2) 
            ((null? set2) set1) 
            ((= (car set1) (car set2))  
            (cons (car set1) (union-set (cdr set1) (cdr set2)))) 
            ((< (car set1) (car set2))   
            (cons (car set1) (union-set (cdr set1) set2))) 
            (else  
            (cons (car set2) (union-set set1 (cdr set2))))))


(define (union-tree-set s1 s2)
    (let (l1 (tree->list-2 s1))
         (l2 (tree->list-2 s2))
        (list->tree (union-set l1 l2))
    )
)

(define (intersection-tree-set s1 s2)
    (let (l1 (tree->list-2 s1))
         (l2 (tree->list-2 s2))
        (list->tree (intersection-set l1 l2))
    )
)