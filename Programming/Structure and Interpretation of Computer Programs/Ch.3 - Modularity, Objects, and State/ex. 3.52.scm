Exercise 3.52. Consider the sequence of expressions

(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                          seq))
(stream-ref y 7)
(display-stream z)

What is the value of sum after each of the above expressions is evaluated? What is the printed response to
evaluating the stream-ref and display-stream expressions? 

(stream-ref y 7)
>> the stream-ref is refering on the filtered even seq, which in turn
is a accumulated list.
the "even?" is applied on the result of accum
(6 10 28 36 66 78 120 136)
hence the 8th of the even accumulated list should 136. note that 
"stream-enumerate-interval" should be up to the 16th iteration

(display-stream z)
>> the seq is now up to #17 iteration, the remaining accum list is
(153 171 190 210)
hence only last two item shall be returned
(190 210)

Would these responses differ if we
had implemented (delay <exp>) simply as (lambda () <exp>) without using the optimization
provided by memo-proc ? Explain.
>> there will be difference in value, though I don't quite get how so.
