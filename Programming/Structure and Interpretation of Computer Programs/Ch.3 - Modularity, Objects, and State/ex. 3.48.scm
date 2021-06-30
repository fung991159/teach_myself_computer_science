Exercise 3.48: Explain in detail why
the deadlock-avoidance method described
above, (i.e., the accounts are
numbered, and each process attempts to
acquire the smaller-numbered account
first) avoids deadlock in the exchange
problem. Rewrite serialized-exchange to
incorporate this idea. (You will also
need to modify make-account so that
each account is created with a number,
which can be accessed by sending an
appropriate message.)

>> Add a new para for keeping account id in the account, and a selector to return incorporate
then in serialized-exhange, a if logic to check which account has lower acc-id, then
serialized that one first.

(define (make-account-and-serializer balance acc-id)
  (define (withdraw amount)
  (if (>= balance amount)
    (begin (set! balance (- balance amount))
    balance)
    "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'id) acc-id)
            (else (error "Unknown request -- MAKE-ACCOUNT"
      m))))
      dispatch))


(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (acc1_id (account1 'id))
        (acc2_id (account2 'id))
    (if (acc1_id < acc2_id)
      ((serializer2 (serializer1 exchange))
          account1
          account2)
      ((serializer1 (serializer2 exchange))
          account1
          account2)
    )