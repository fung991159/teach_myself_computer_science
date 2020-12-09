; Exercise 2.62: Give a Θ(n) implementation of union-set for 
; sets represented as ordered lists.

; not too bad, this is a slight variatoin of intersection-set, 
; an else clause has been add since we need to cater for when x1 != x2,
; which is where both value need to be taken from both set

 (define (union-set set1 set2) 
   (cond  ((null? set1) set2) 
          ((null? set2) set1) 
          ((= (car set1) (car set2))  
           (cons (car set1) (union-set (cdr set1) (cdr set2)))) 
          ((< (car set1) (car set2))   
           (cons (car set1) (union-set (cdr set1) set2))) 
          (else  
           (cons (car set2) (union-set set1 (cdr set2)))))) 
  


