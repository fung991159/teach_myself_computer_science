Exercise 4.73: Why does flatten-stream use delay ex-
plicitly? What would be wrong with defining it as follows:

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave
        (stream-car stream)
        (flatten-stream (stream-cdr stream)))))

>> because it is possible that an element of stream contains extended stream in it that is infinite. so to not get stucked into any one infinite stream again, lazy evaluation was used.