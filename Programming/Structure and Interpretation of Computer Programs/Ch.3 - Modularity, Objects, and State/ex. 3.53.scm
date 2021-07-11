Exercise 3.53. Without running the program, describe the elements of the stream 
defined by
(define s (cons-stream 1 (add-streams s s)))

>> s will return the sum of two stream of same number, starting from 1
basically it will times 2 of the previous number
(1 2 4 8 16 32)