; Exercise 2.68: The encode procedure takes as arguments a message and a tree and produces the list
;  of bits that gives the encoded message.

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
; encode-symbol is a procedure, which you must write, that returns
; the list of bits that encodes a given symbol according
;  to a given tree. You should design encode-symbol so that
;  it signals an error if the symbol is not in the tree at
;  all. Test your procedure by encoding the result you obtained
;  in Exercise 2-67 with the sample tree and seeing whether it is the same as the original sample message.

; ! didn't  get this myself :(, I got the cons 0/1 base on branch selection,
; ! but didn't get how to do it recursively, and using memq to check the present of item in list.
; ! I think it is largely due to not understanding how the tree structure and its method.

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (encode-symbol symbol tree)
  (display tree) (newline)
  (cond ((not (memq symbol (symbols tree)))
         (error "bad symbol -- ENCODE-SYMBOL" symbol))
        ((leaf? tree) '())
        ((memq symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((memq symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))))