Exercise 3.63. Louis Reasoner asks why the sqrt-stream procedure was not written in the following
more straightforward way, without the local variable guesses:
(define (sqrt-stream x)
  (cons-stream 1.0
    (stream-map (lambda (guess)
                  (sqrt-improve guess x))
                (sqrt-stream x))))

Alyssa P. Hacker replies that this version of the procedure is considerably less efficient because it performs
redundant computation. Explain Alyssa's answer. 

>> in the above solution sqrt-stream has been called recursively, everytime
it was call, a new stream were to created.
The original version only created stream "guesses" once, each new element will be
computed and stored by memorized. Hence more efficient.


Would the two versions still differ in efficiency if our
implementation of delay used only (lambda () <exp>) without using the optimization provided by
memo-proc (section 3.5.1)?

>> yes. They will be as inefficient in this way.