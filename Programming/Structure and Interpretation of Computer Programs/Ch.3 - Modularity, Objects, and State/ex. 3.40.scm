Exercise 3.40: Give all possible values of x that can result from executing

(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))

>> the tricker part is now P2 access x 3 times
>> 6 sceanrios, but 5 distinct output possible

100: p1 (x=10) run last
1000: p2 (x=10) run last
10000:
  a. p1 first x=10, second x=1000 (p2 result)
  b. p2 access  first and second x =10, third x = 100 (p1 result)
100000: p2 first x= 10, second and third x =100(p1 result)
1000000:
  a. p1 access all x=1000
  b. p2 access all x=100

Which of these possibilities remain if we instead use serialized procedures:

(define x 10)
  (define s (make-serializer))
  (parallel-execute (s (lambda () (set! x (* x x))))
                    (s (lambda () (set! x (* x x x)))))

>> once serialized, only last outcome 1000000 is possible.
because x access can only be the final outcome of either p1 or p2
