; Exercise 3.4. Modify the make-account procedure of exercise 3.3 by adding another local state
; variable so that, if an account is accessed more than seven consecutive times with an incorrect password, it
; invokes the procedure call-the-cops.

; >> basically add a varaiable to store password retry state,
; >> then if it is equal 7 then call cops
; >> here how to add error handling into the disptacher is actually
; >> quite annoying. Since we are returning the method instead of any value.
; >> need to cater for the parameter as well, even in error handling method

(define (make-account balance password)
  (let ((pwd-retry-counter 0))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (error-handling amount)
    ; amount is not used, just to match the other dispatch method
    (set! pwd-retry-counter (+ pwd-retry-counter 1))
    (display "wrong attempt ") (display pwd-retry-counter) (newline)
    (if (= pwd-retry-counter 7)
      (error "call-the-cops!"))
  )
  (define (dispatch inpwd m)
    ; if password is right, do the disptaching.
    ; otherwise return error-handling method
    (if (eq? inpwd password)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                        m))
      )
      error-handling
    ))

  dispatch))

(define acc (make-account 100 'test))
(display ((acc 'test2 'withdraw) 10))
(display ((acc 'test2 'withdraw) 10))
(display ((acc 'test1 'withdraw) 10))
(display ((acc 'test1 'withdraw) 10))
(display ((acc 'test1 'withdraw) 10))
(display ((acc 'test1 'withdraw) 10))
(display ((acc 'test1 'withdraw) 10))


; (newline)
; (display ((acc 'test1 'withdraw) 10))
; (newline)
; (display ((acc 'test 'withdraw) 10))
; (newline)