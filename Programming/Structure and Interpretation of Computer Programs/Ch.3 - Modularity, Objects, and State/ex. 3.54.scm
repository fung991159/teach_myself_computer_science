Exercise 3.54. Define a procedure mul-streams, analogous to add-streams, that
produces the
elementwise product of its two input streams. Use this together with the stream
of integers to complete
the following definition of the stream whose nth element (counting from 0) is n
+ 1 factorial:

(define factorials (cons-stream 1 (mul-streams <??> <??>)))

>> just a slight change from add-streams
(define (mul-streams s1 s2)
  (stream-map * s1 s2)
)

(define integers (cons-stream 1 (add-streams ones integers)))

(define factorials (cons-stream 1
                     (mul-streams (stream-cdr integers) factorials)))


