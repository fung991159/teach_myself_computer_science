; Exercise 3.3. Modify the make-account procedure so that it creates password-protected accounts.
; That is, make-account should take a symbol as an additional argument, as in
; (define acc (make-account 100 'secret-password))
; The resulting account object should process a request only if it is accompanied by the password with
; which the account was created, and should otherwise return a complaint:
; ((acc 'secret-password 'withdraw) 40)
; 60
; ((acc 'some-other-password 'deposit) 50)
; "Incorrect password"

>> basically just adding the password checking logic before disptaching job

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch inpwd m)
    (if (not (eq? inpwd password))
        (error "INVALID PASSWORD!")
    )
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define acc (make-account 100 'test))
(display ((acc 'test 'withdraw) 10))
(newline)