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
  (let ((front-ptr car)
        (rear-ptr cdr)
        (queue (cons '() '())))

  (define (set-front-ptr! queue item) (set-car! queue item))
  (define (set-rear-ptr! queue item) (set-cdr! queue item))
  (define (empty-queue? queue) (null? (front-ptr queue)))

  (define (front-queue)
    (if (empty-queue? queue)
        (error "FRONT called with an empty queue" queue)
        (car (front-ptr queue))))

  (define (insert-queue! item)
    (let ((new-pair (cons item '())))
      (cond ((empty-queue? queue)
            (set-front-ptr! queue new-pair)
            (set-rear-ptr! queue new-pair)
            queue)
            (else
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue))))

  (define (delete-queue!)
    (cond ((empty-queue? queue)
          (error "DELETE! called with an empty queue" queue))
          (else
          (set-front-ptr! queue (cdr (front-ptr queue)))
          queue)))

  (define (dispatch m)
    (cond ((eq? m 'front-queue) (front-queue))
          ((eq? m 'insert-queue!) insert-queue!)
          ((eq? m 'delete-queue!) (delete-queue!))
    )
  )

  dispatch))

; create queue
(define q1 (make-queue))
((q1 'insert-queue!) 'a)
((q1 'insert-queue!) 'b)
(q1 'front-queue)
; >> a
(q1 'delete-queue!)
; >> deleted a
(q1 'front-queue)
; >> b
