;Exercise 2.66: Implement the lookup procedure for the case where the set of records 
;is structured as a binary tree, ordered by the numerical values of the keys.

; this is just rewriting element-of-set for ordered list, + converting the input from 
; tree to list first

(define (lookup given-key set-of-records)
  (let (list-of-records (tree->list2 set-of-records))
  (cond ((null? list-of-records) #f)
        ((= given-key (key (car list-of-records)) (car list-of-records))
        ((< given-key (key (car list-of-records)) #f)
        (else (lookup given-key (cdr list-of-records))))))
