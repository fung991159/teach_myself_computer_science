Exercise 4.53: With permanent-set! as described in Exer-
cise 4.51 and if-fail as in Exercise 4.52, what will be the
result of evaluating
  (let ((pairs '()))
    (if-fail
      (let ((p (prime-sum-pair '(1 3 5 8)
                                '(20 35 110))))
      (permanent-set! pairs (cons p pairs))
      (amb))
    pairs))

>> in if-fail, the suceed part is definitely going to fail, given the plain amb without argument. Hence "pairs" will be returned, which was mutated because of 
"(permanent-set! pairs (cons p pairs))", it could be any combination of pairs that is prime from the two list. e.g. (3 20)
