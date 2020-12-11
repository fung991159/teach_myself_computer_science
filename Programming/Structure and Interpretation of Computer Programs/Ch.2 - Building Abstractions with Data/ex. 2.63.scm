(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                              (right-branch tree)
                              result-list)))))
  (copy-to-list tree '()))

; a. Do the two procedures produce the same results for every tree? If not, 
; how do the results differ? What lists do the two procedures produce fot the trees in Figure 2.16?
(define tree1 '(7 
                (3 
                  (1 () ()) 
                  (5 () ()))
                (9 
                  () 
                  (11 () ()))
              ))

(define tree2 '(3 
                (1 () ()) 
                (7 
                  (5 () ()) 
                  (9 () 
                    (11 () ())))))

(define tree3 '(5
                (3 
                  (1 () ()) 
                  ())
                (9
                  (7 () ())
                  (11 () ()))))

; all return the same result (1 3 5 7 9 11)

;b. Do the two procedures have the same order of growth in the number of steps required to convert a
; balanced tree with n elements to a list? If not, which one grows more slowly?
;>>  recusive one would use more memory to store the state, and require more steps
;>> to sort out the previous stored state once it reach the "bottom"