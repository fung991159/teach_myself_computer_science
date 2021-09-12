Exercise 4.27. Suppose we type in the following definitions to the lazy evaluator:
(define count 0)
(define (id x)
  (set! count (+ count 1))
  x)

Give the missing values in the following sequence of interactions, and explain your answers.

(define w (id (id 10)))
;;; L-Eval input:
count
;;; L-Eval value:
1
;;; L-Eval input:
w
;;; L-Eval value:
10
;;; L-Eval input:
count
;;; L-Eval value:
2

>> when defining w, we need invoke id once with argumetn (id 10), this make count = 1
>> when invoking w, the argument id is invoked, hence count is now 2,
w will return value of 10 because id will just return whatver argument value

