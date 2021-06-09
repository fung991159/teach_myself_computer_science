Exercise 3.18. Write a procedure that examines a list and determines whether it contains a cycle, that is,
whether a program that tried to find the end of the list by taking successive cdrs would go into an infinite
loop. Exercise 3.13 constructed such lists.

>> basically we are checking if the item is in the "eq" checked / visisted list
>> slight modification from 3.17

(define (check-cycle x)
  (define checked '())
  (define (loop-list curr-pair)
    (cond
          ((null? curr-pair) #f)
          ((memq (car curr-pair) checked) #t)
          (else
           (begin
             (set! checked (cons (car curr-pair) checked))
             (loop-list (cdr curr-pair))))))
  (loop-list x)
  )