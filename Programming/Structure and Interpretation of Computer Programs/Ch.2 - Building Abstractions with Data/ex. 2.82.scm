Exercise 2.82. Show how to generalize apply-generic to handle coercion in the general case of
multiple arguments. One strategy is to attempt to coerce all the arguments to the type of the first argument,
then to the type of the second argument, and so on. Give an example of a situation where this strategy (and
likewise the two-argument version given above) is not sufficiently general. (Hint: Consider the case where
there are some suitable mixed-type operations present in the table that will not be tried.)

;; my attempt to turn apply-generic for generic coercion.
;; one of the issue about "not sufficiently general" is this is checking
;; two arguments in pairs. first two, then the next two etc. so the 2nd and 3rd arguments
;; were never looked as a pair, even though a coercion procedure maybe available

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (and (> (length args) 2) (= (length args) 2))  ;; will try conerce whever args length >= 2
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                          (apply-generic op (cddr args))  ;; this will pass all the args, except the first two that has been tried with type conersion
                         )))))
              (error "No method for these types"
                     (list op type-tags)))))))

!! once again googling provide a lot more complete solution to the question
!! http://jots-jottings.blogspot.com/2012/02/sicp-exercise-282-multi-argument.html

(define (coerce-to target-type remaining-args result)
  (if (null? remaining-args)
      result  ;; base case return result
      (let* ((arg (car remaining-args))
             (original-type (type-tag arg)))
        ;; for each arg, if arg type is same as target type, no conversion, append arg to result and call itself with remaining arg
        (if (eq? original-type target-type)
            (coerce-to target-type
                       (cdr remaining-args)
                       (append result (list arg)))
        ;; if type is diff, try to get coerce procedure with get-coercion
            (let ((original->target (get-coercion (type-tag arg) target-type)))
              ;; if coercision procedure exist, convert the arg type and append to result then call itself with remaining arg
              (if original->target
                  (coerce-to target-type
                             (cdr remaining-args)
                             (append result (list (original->target arg))))
                  ;; if coercsion procedure does not exist, return false
                  #f))))))

(define (apply-generic-iter coercion-types)
  (if (null? coercion-types)
      (error "No method for these types, and could not coerce"
             (list op (map type-tag args)))
      (let ((coerced-args (coerce-to (car coercion-types) args '())))
        (if coerced-args
            (let ((proc (get op (map type-tag coerced-args))))
              (if proc
                  (apply proc (map contents coerced-args))
                  (apply-generic-iter (cdr coercion-types))))
            (apply-generic-iter (cdr coercion-types))))))