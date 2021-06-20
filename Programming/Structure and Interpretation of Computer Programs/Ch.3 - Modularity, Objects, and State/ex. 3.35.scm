Exercise 3.35: Ben Bitdiddle tells Louis that one way to avoid the trouble in
Exercise 3-34 is to define a squarer as a new primitive constraint. Fill in the
missing portions in Ben's outline for a procedure to implement such a
constraint:

>> this is easy, find-and-replace job

(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0 -- SQUARER" (get-value b))
						(set-value! a
												(expt (get-value a) 0.5)
												me))
				(if (< (get-value a) 0)
						(error "number less than 0 -- SQUARER" (get-value a))
						(set-value! b
												(* (get-value a) (get-value a))
												me))))
  (define (process-forget-value)
    (forget-value! b me)
    (forget-value! a me)
    (process-new-value))
	)
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))
          (else
           (error "Unknown request -- SQUARER" request))))
  (connect a me)
  (connect b me)
  me)