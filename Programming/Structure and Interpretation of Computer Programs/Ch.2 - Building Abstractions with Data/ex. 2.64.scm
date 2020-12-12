; Exercise 2.64: The following procedure list->tree converts an ordered list to a balanced binary tree. 
; The helper procedure partial-tree takes as arguments an integer n and list of at least n elements 
; and constructs a balanced tree containing the first n elements of the list. The result returned by 
; partial-tree is a pair (formed with cons) whose car is the constructed tree and whose cdr is 
; the list of elements not included in the tree.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2))) ;
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; Write a short paragraph explaining as clearly as you can how partial-tree works. Draw the tree produced by list->tree for the list (1 3 5 7 9 11).
; basically it just break down the list into two half, with left/right result. 
; the car "left-result" will be left-tree, while car of "left-result" is the node netry,
; then cdr of "left-result" will be called by partial-tree to get the right result (???)

; ! after peeking at some other people writing the concept is a little more clear
; basically it is just:
; 1. divide the list into left and right half
; 2. first item is left-tree, 2nd item is entry, 3rd item is right-tree
; 3. above action will be done recursively

; What is the order of growth in the number of steps required by list->tree to convert a list of n elements?
; the order of growth will be n as each element need to do cons once

