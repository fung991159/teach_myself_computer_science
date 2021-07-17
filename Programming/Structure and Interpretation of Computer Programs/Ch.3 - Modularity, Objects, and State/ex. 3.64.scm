Exercise 3.64. Write a procedure stream-limit that takes as arguments a stream and a number (the
tolerance). It should examine the stream until it finds two successive elements that differ in absolute value
by less than the tolerance, and return the second of the two elements. Using this, we could compute square
roots up to a given tolerance by
(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

>> this one is rather simple.

(define (stream-limit s tolerance)
  (let ((first (stream-car s)))
       ((second (stream-car (stream-cdr s))))
  (if (> tolerance (abs (- first second)))
    (stream-car (stream-cdr s))
    (stream-limit (stream-cdr s) tolerance)
  ))
)
