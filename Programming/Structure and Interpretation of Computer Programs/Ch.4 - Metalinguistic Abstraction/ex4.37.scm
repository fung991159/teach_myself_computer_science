Exercise 4.37: Ben Bitdiddle claims that the following method
for generating Pythagorean triples is more efficient than
the one in Exercise 4.35. Is he correct? (Hint: Consider the
number of possibilities that must be explored.)

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high))
        (hsq (* high high)))
    (let ((j (an-integer-between i high)))
      (let ((ksq (+ (* i i) (* j j))))
        (require (>= hsq ksq))
        (let ((k (sqrt ksq)))
          (require (integer? k))
          (list i j k))))))

>> yes this would be more efficient. (require (>= hsq ksq)) back track only need to test i and j combination. And testing if k is integer is a lot cheaper than searching for k in a range of number as in 4.35