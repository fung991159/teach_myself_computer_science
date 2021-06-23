Exercise 3.39: Which of the five possibilities in the parallel execution shown
above remain if we instead serialize execution as follows:

(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

>> since the first procedure is not entirely serialized.
It is possible to intervine with the 2nd procedure by
first accessing x=10, computing new x to 10*10 = 100, and overwrite
the 2nd procedure result of x = 11. leaving us with final result x = 100.
The other result are 101 (10*10 + 1) and 121 ((10+1)*11) if the procs happens
to not intertwine by luck.