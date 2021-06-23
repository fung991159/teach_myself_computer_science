Exercise 3.39: Which of the five possibilities in the parallel execution shown
above remain if we instead serialize execution as follows:

(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

>> since the first procedure is not serialized. It is possible to intervine
with the 2nd procedure by setting x to 10*10 = 100.
The other result are 101 (10*10 + 1) and 121 ((10+1)*11)