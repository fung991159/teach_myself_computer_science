Exercise 3.68. Louis Reasoner thinks that building a stream of pairs from three parts is unnecessarily
complicated. Instead of separating the pair (S0,T0) from the rest of the pairs in the first row, he proposes to
work with the whole first row, as follows:
(define (pairs s t)
    (interleave
        (stream-map (lambda (x) (list (stream-car s) x))
        t)
        (pairs (stream-cdr s) (stream-cdr t))))
Does this work? Consider what happens if we evaluate (pairsdefinition of pairs.

>> this would not work as interleave by itself is a normal procedure,
it will try to evaluate one of the stream-map on a infinite list,
hence run forever
