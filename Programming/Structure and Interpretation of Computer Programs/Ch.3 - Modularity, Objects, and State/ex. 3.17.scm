Exercise 3.17. Devise a correct version of the count-pairs procedure of exercise 3.16 that returns the
number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining an auxiliary data
structure that is used to keep track of which pairs have already been counted.)

>> basically this should involve saving the counted pair in a variable
>> in a list, then use "eq?" to see if they point to the same pair

(define (memq item x)
  (cond ((null? x) #f)
  ((eq? item (car x)) #t)
    (else (memq item (cdr x)))))


(define (count-pairs x)
  (define checked '())
  (define (loop-list curr-pair)
    (cond ((not (pair? curr-pair)) 0)
          ((null? curr-pair) 0)
          ((memq (car curr-pair) checked) 0)
          (else
           (begin
             (set! checked (cons (car curr-pair) checked))
             (+ (loop-list (car curr-pair))
                (loop-list (cdr curr-pair))
                1)))))
  (loop-list x))
