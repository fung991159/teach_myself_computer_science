implemented above, one needs to scan through the list of records. This is
basically the unordered list representation of section 2.3.3. For large tables,
it may be more efficient to structure the table in a different manner. Describe
a table implementation where the (key, value) records are organized using a
binary tree, assuming that keys can be ordered in some way (e.g., numerically
or alphabetically). (Compare Exercise 2-66 of Chapter 2.)

>> this is combining the set operation from chapter.2

(define (make-table)
   (define (entry tree) (car tree))
   (define (left-branch tree) (cadr tree))
   (define (right-branch tree) (caddr tree))
   (define (make-tree entry left right)
     (list entry left right))

   (define (node-key entry)
     (car entry))
   (define (node-value entry)
     (cdr entry))
   (define (make-node key value)
     (cons key value))
   (define (set-value! node value)
     (set-cdr! node value))

   (let ((root (list )))

     (define (lookup key)
       (define (iter tree)
         (cond ((null? tree) #f)
               (else
                (let ((node (entry tree))
                      (left (left-branch tree))
                      (right (right-branch tree)))
                  (cond ((= key (node-key node)) (node-value node))
                        ((< key (node-key node)) (iter left))
                        ((> key (node-key node)) (iter right)))))))
       (iter root))

     (define (insert! key value)
       (define (iter tree)
         (cond ((null? tree) (make-tree (make-node key value) '() '()))
               (else
                (let ((node (entry tree))
                      (left (left-branch tree))
                      (right (right-branch tree)))
                  (cond ((= key (node-key node))
                         (set-value! node value)
                         tree)  ; update existing key
                        ((< key (node-key node))
                         (make-tree node (iter left) right))
                        ((> key (node-key node))
                         (make-tree node left (iter right))))))))
       (set! root (iter root)))

     (define (dispatch m)
       (cond ((eq? m 'lookup) lookup)
             ((eq? m 'insert!) insert!)
             ((eq? m 'display) (display root) (newline))
             (else (error "Unknown operation -- TREE" m))))

     dispatch))

(define (show tree) (tree 'display))
 (define (lookup tree key) ((tree 'lookup) key))
 (define (insert! tree key value) ((tree 'insert!) key value))

(define t (make-table))
 (show t)
 (insert! t 7 'a)
 (show t)
 (insert! t 3 'b)
 (show t)
 (insert! t 9 'c)
 (show t)
 (insert! t 5 'd)
 (show t)
 (insert! t 1 'e)
 (show t)
 (insert! t 11 'f)
 (show t)
 (lookup t 5)
 (lookup t 1)
 (lookup t 9)
 (insert! t 9 'xxx)
 (lookup t 9)
 (lookup t 27)