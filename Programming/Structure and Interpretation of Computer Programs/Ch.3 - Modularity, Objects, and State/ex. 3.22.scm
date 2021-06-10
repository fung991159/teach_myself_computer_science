Exercise 3.22. Instead of representing a queue as a pair of pointers, we can build a queue as a procedure
with local state. The local state will consist of pointers to the beginning and the end of an ordinary list.
Thus, the make-queue procedure will have the form
(define (make-queue)
  (let ((front-ptr ...)
  (rear-ptr ...))
  <definitions of internal procedures>
  (define (dispatch m) ...)

  dispatch))

Complete the definition of make-queue and provide implementations of the queue operations using this
representation.

; >> basically just put everything indo the prcoedure make-queuem, and have dispatch call those method
; the only variation is all methods no longer requires target queue since it is stored internally


(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

  (define (empty-queue?) (null? front-ptr))

  (define (front-queue)
    (if (empty-queue?)
        (error "FRONT called with an empty queue")
        (car (front-ptr))))

  (define (insert-queue! item)
    (let ((new-pair (cons item '())))
      (cond ((empty-queue?)
            (set! front-ptr new-pair)
            (set! rear-ptr new-pair))
            (else
            (set-cdr! rear-ptr new-pair)
            (set! rear-ptr new-pair)))))

  (define (delete-queue!)
    (cond ((empty-queue?)
          (error "DELETE! called with an empty queue"))
          (else
            (set! front-ptr (cdr front-ptr))
            )))

  (define (print-queue) (display front-ptr) (newline))

  (define (dispatch m)
    (cond ((eq? m 'front-queue) (front-queue))
          ((eq? m 'insert-queue!) insert-queue!)
          ((eq? m 'delete-queue!) (delete-queue!))
          ((eq? m 'print-queue) (print-queue))
    )
  )

  dispatch))

; create queue
(define q1 (make-queue))
((q1 'insert-queue!) 'a)
((q1 'insert-queue!) 'b)
(q1 'print-queue')
; >> (a b)
(q1 'delete-queue!)
; >> b
