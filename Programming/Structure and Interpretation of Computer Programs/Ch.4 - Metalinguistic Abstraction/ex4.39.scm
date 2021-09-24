Exercise 4.39: Does the order of the restrictions in the multiple-
dwelling procedure affect the answer? Does it affect the
time to find an answer? If you think it matters, demonstrate
a faster program obtained from the given one by reordering
the restrictions. If you think it does not matter, argue your
case.



(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5)) (cooper (amb 1 2 3 4 5))
    (fletcher (amb 1 2 3 4 5)) (miller (amb 1 2 3 4 5))
    (smith (amb 1 2 3 4 5)))
    (require
      (distinct? (list baker cooper fletcher miller smith)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (require (> miller cooper))
    (require (not (= (abs (- smith fletcher)) 1)))
    (require (not (= (abs (- fletcher cooper)) 1)))
    (list (list 'baker baker)       (list 'cooper cooper)
          (list 'fletcher fletcher) (list 'miller miller)
          (list 'smith smith))))

>> it matters because the more "depth" the amb evaluator go, the more level and step it requires to backtrack if the path isn't the right one. so the strategy is to put the restrictions that is harder to satisfy first, in order to reduce the number of steps that need to backtrack if the path isn't the right one

>> this is right to be at first since it is 5! combination
(require
  (distinct? (list baker cooper fletcher miller smith)))

>> this part should be next as has more possibilities than the next part
(require (> miller cooper))
(require (not (= (abs (- smith fletcher)) 1)))
(require (not (= (abs (- fletcher cooper)) 1)))

>> these should be last
(require (not (= baker 5)))
(require (not (= cooper 1)))
(require (not (= fletcher 5)))
(require (not (= fletcher 1)))