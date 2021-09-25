Exercise 4.41: Write an ordinary Scheme program to solve
the multiple dwelling puzzle.

>> the permutations from ch.2 will produce all possible combination of floor, next is just to filter by the constraint

(define (multiple-dwelling-original)
  (define (constraint pmt)
    (let ((baker (car pmt)))
         (cooper (cadr pmt))
         (miller (caddr pmt))
         (fletcher (cadddr pmt))
         (smith (caddddr pmt))

        (and 
            (not (= baker 5))
            (not (= cooper 1))
            (not (= fletcher 5))
            (not (= fletcher 1))
            (> miller cooper)
            (not (= (abs (- smith fletcher)) 1))
            (not (= (abs (- fletcher cooper)) 1))
        )
  )
  (filter constaint (permutations (list 1 2 3 4 5)))
)