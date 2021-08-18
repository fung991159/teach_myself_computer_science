Exercise 4.11. Instead of representing a frame as a pair of lists, we can represent a frame as a list of
bindings, where each binding is a name-value pair. Rewrite the environment operations to use this
alternative representation.

>> basically this is using "table"/ dict to represent environemnt 

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (make-frame variables values)
  (let ((frame (make-table)))
    (define (iter variables value)
      (let ((var (car variables))
            (val (car value)))
        (if (null? var)
            frame
            (begin
              (insert! (car variables) (car values) frame)
              (iter (cdr variables) (cdr value))))))))
  (iter variables values)
)


>> slight change to how to get to the var and val
(define (frame-variables frame)
    (cond ((null? frame) '())
          (else
            (cons (caar frame)
                  (frame-variables (cdr frame))))))

(define (frame-values frame)
    (cond ((null? frame) '())
          (else
            (cons (cadar frame)
                  (frame-values (cdr frame))))))

>> it is actually easiers to add binding to frame, now that we don't need to worry about item order
(define (add-binding-to-frame! var val frame)
  (insert! var val frame)
  )

(define (frame-lookup var frame)
  (lookup var frame)
)

>> no change in lookup/set/define variable as the selector will return the same frame-variables and values as list






