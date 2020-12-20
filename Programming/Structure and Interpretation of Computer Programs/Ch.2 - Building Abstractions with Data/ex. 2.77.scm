Exercise 2.77: Louis Reasoner tries to evaluate the expression (magnitude z) where z is the object shown in Figure 2-24.
To his surprise, instead of the answer 5 he gets an error message from apply-generic,
 saying there is no method for the operation magnitude on the types (complex).
  He shows this interaction to Alyssa P. Hacker,
  who says "The problem is that the complex-number selectors were never defined
  for complex numbers, just for polar and rectangular numbers. All you have to do to make this work
  is add the following to the complex package:"

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

Describe in detail why this works. As an example, trace through all the procedures called in
evaluating the expression (magnitude z) where z is the object shown in Figure 2-24. In particular,
how many times is apply-generic invoked? What procedure is dispatched to in each case?


! can't really get this one, but looking at solution makes things little clearer
! first, magnitude as a prcoedure doesn't exist in the dispatch table
! (magnitude) procedure itself is a  apply-generic, so to make it callable it has to be added back as 
! the 4 line of put in exercise question.

step 1. magnitude procedure will call apply-generic with type magnitude procedure on object z
step 2. apply-generic get the first tag complex with op = 'magnitude', type = 'complex'
step 3. this is just the magnitude procedure itself, so apply-generic got called once again,
        but this time with op= 'magnitude', type = 'rectangular'
step 4. so magnitude in real part get triggered

(define (z) '(complex rectangular 3 4))
(define (magnitude z) (apply-generic 'magnitude z))

(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (error
          "No method for these types -- APPLY-GENERIC"
          (list op type-tags))))))

