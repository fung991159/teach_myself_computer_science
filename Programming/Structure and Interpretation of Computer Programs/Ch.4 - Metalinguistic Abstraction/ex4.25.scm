Exercise 4.25. Suppose that (in ordinary applicative-order Scheme) we define unless as shown above
and then define factorial in terms of unless as

(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))



(define (factorial n)
  (unless (= n 1)
          (* n (factorial (- n 1)))
          1))

What happens if we attempt to evaluate (factorial
5)? Will our definitions work in a normal-order language?

>> both usual-value and exceptional-value will be evaulated even "unless" is not called. the exceptional-value will stuck in infinite loop. Even when it comes to n=1, it would not stop because the procedure need to evaluate factorial(0)

>> in normal-order it will works fine as argument isn't evaluated until needed. If n = 1 it will just evalulate integer 1 and stop the recursion.

