; Exercise 3.7: Consider the bank account objects created by make-account, with
; the password modification described in Exercise 3-3. Suppose that our banking
; system requires the ability to make joint accounts. Define a procedure
; make-joint that accomplishes this. Make-joint should take three arguments. The
; first is a password-protected account. The second argument must match the
; password with which the account was defined in order for the make-joint
; operation to proceed. The third argument is a new password. Make-joint is to
; create an additional access to the original account using the new password. For
; example, if peter-acc is a bank account with password open-sesame, then

; (define paul-acc
;   (make-joint peter-acc 'open-sesame 'rosebud))

; will allow one to make transactions on peter-acc using the name paul-acc and
; the password rosebud. You may wish to modify your solution to Exercise 3-3 to
; accommodate this new feature

; >> since now an account can cater for 2 passwords,
; so passwords must be stored in an array and check against the array
; assume we can only have 2 passwords in a joint account and no more
; (otherwise when verifying existing pwd in "make-joint" will be exceedingly
; difficult)

; >> define a curr-pwd attribute, which is a list even it is a personal acct
; >> pwd checking is now checking always check against a list (curr-pwd)
; instead of a string
; once we need to store state, we need all those getter, setter, deleter to aid
; changing state of the class

; from ex3.3
(define (make-account balance password)
  (let ((curr-pwd (cons password nil))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch inpwd m)
    (if (not (contains? inpwd curr-pwd))
        (error "INVALID PASSWORD!")
    )
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'pwd-setter') pwd-setter)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))

  (define (pwd-setter new-pwd)
    ; if curr-pwd is a list (only one password), then
    ; replace curr-pwd with list of both pwd, otherwise raise an error
    (define (is-joint-acct)
      (if (> 1 (length curr-pwd))
        #t
        #f
    ))

    (if (is-joint-acct)
      (error "this is already a joint account with two password!")
      (set! curr-pwd (append curr-pwd new-pwd))
    )
  )
  dispatch))

(define (make-joint acct pwd new-pwd)
  ((acct pwd 'pwd-setter) new-pwd)
)
