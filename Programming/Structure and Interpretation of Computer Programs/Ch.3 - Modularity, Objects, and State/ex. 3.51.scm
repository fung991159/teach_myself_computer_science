Exercise 3.51. In order to take a
closer look at delayed evaluation, we
will use the following procedure,
which simply returns its argument after
printing it:

(define (show x)
    (display-line x)
    x)

What does the interpreter print in
response to evaluating each expression
in the following sequence?

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)
>> this will show 0 up to 5
(stream-ref x 7)
>> this will show 6 to 7


>> (stream-enumerate-interval 0 10) is a streamed list of 0 to 10
x is a streamed list of show procedure
stream-ref construct the list until it hit the index,
cons-stream make used of "delay", which by default will store the computed
value, hence calling the same stream will not invovke the show function
from beginning
