Exercise 2.81. Louis Reasoner has noticed that apply-generic may try to coerce the arguments to
each other's type even if they already have the same type. Therefore, he reasons, we need to put procedures
in the coercion table to "coerce" arguments of each type to their own type. For example, in addition to the
scheme-number->complex coercion shown above, he would do:

(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)
(put-coercion 'scheme-number 'scheme-number
              scheme-number->scheme-number)
(put-coercion 'complex 'complex complex->complex)

a. With Louis's coercion procedures installed, what happens if apply-generic is called with two
arguments of type scheme-number or two arguments of type complex for an operation that is not
found in the table for those types? For example, assume that we've defined a generic exponentiation
operation:
  (define (exp x y) (apply-generic 'exp x y))
and have put a procedure for exponentiation in the Scheme-number package but not in any other package:
;; following added to Scheme-number package
(put 'exp '(scheme-number scheme-number)
  (lambda (x y) (tag (expt x y)))) ; using primitive expt
What happens if we call exp with two complex numbers as arguments?

>> if exp were called with two complex number as arguments, since in complex-number-package there is no such procedure,
>> it will try to conerce types using type1 to type2, but here it is again "complex->complex", which will call for 
>> type conercion again. Hence we are entering into a infinite loop.

b. Is Louis correct that something had to be done about coercion with arguments of the same type, or does
apply-generic work correctly as is?
>> it work correctly as is, if a procedure exist for a operation of one type,
>> no coercion will ever take place. Only when it doesn't exist then type will start
>> to be coerced, first with first type argument coerce into 2nd type. If not work then the other around.


c. Modify apply-generic so that it doesn't try coercion if the two arguments have the same type.
(define (new-apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (and (= (length args) 2) (= (car type-tags) (cdr type-tags)))  ;; added type tags comparision
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
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))