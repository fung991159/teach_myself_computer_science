Exercise 3.81. Exercise 3.6 discussed generalizing the random-number generator
to allow one to reset the
random-number sequence so as to produce repeatable sequences of ``random''
numbers. Produce a stream
formulation of this same generator that operates on an input stream of requests
to generate a new
random number or to reset the sequence to a specified value and that produces
the desired stream of
random numbers. Don't use assignment in your solution.


"""
Exercise 3.6. It is useful to be able to reset a random-number generator to
produce a sequence starting
from a given value. Design a new rand procedure that is called with an argument
that is either the symbol
generate or the symbol reset and behaves as follows: (rand 'generate) produces
a new
random number; ((rand 'reset) <new-value>) resets the internal state variable
to the
designated <new-value>. Thus, by resetting the state, one can generate
repeatable sequences. These are
very handy to have when testing and debugging programs that use random numbers.
"""

(define random-numbers
  (cons-stream random-init
               (stream-map rand-update random-numbers)))


(define (rand symbol)
  (cond ((eq? symbol 'generate') (stream-car random-numbers))
        ((eq? symbol 'reset')
          (lambda (new-value)
            new-value)
        (else (error "invalid symbol!"))))
