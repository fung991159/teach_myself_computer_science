;Exercise 2.66: Implement the lookup procedure for the case where the set of records 
;is structured as a binary tree, ordered by the numerical values of the keys.

; this is just rewriting element-of-set for ordered list, + converting the input from 
; tree to list first

(define (lookup given-key set-of-records)
  (let entry-key (key (car set-of-records))
    (cond ((null? list-of-records) #f)
            ((= given-key entry-key)
                (car set-of-records))
            ((< given-key entry-key)
                (lookup given-key (left-branch set-of-records)))
            ((> given-key entry-key)
                (lookup given-key (right-branch set-of-records))
            ))))

