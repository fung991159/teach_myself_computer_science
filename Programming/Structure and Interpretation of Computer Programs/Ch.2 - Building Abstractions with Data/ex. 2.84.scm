Exercise 2.84. Using the raise operation of exercise 2.83, modify the apply-generic procedure so
that it coerces its arguments to have the same type by the method of successive raising, as discussed in this
section. You will need to devise a way to test which of two types is higher in the tower. Do this in a
manner that is ``compatible'' with the rest of the system and will not lead to problems in adding new levels
to the tower.

>> my attempt to this question, it actually is easier than I thought
>> tag-rank is to assign a rank number to each datatype in the tower, from low to higher
>> in apply-generic will then check the ranking between arguments, call "raise" for the
>> argument with lower rank  (same argument type won't need checking in the first place)

(define (tag-rank tag)
  (cond ((eq? type 'scheme-number) 0)
        ((eq? type 'rational) 1)
        ((eq? type 'complex) 2)
        (else "ERROR: not a valid tag type")
  )
)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (cond (> (tag-rank type1) (tag-rank type2))  ;; raise the lower rank type
                        (apply-generic op ((get 'raise type1) a1) a2)
                      (< (tag-rank type1) (tag-rank type2))
                        ((apply-generic op a1 ((get 'raise a2) a2))
                ))))
              (error "No method for these types"
                      (list op type-tags))))))