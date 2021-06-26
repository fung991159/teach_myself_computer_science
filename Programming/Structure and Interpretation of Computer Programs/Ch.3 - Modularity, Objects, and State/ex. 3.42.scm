Exercise 3.42. Ben Bitdiddle suggests that it's a waste of time to create a new
serialized procedure in
response to every withdraw and deposit message. He says that make-account could
be changed
so that the calls to protected are done outside the dispatch procedure. That
is, an account would
return the same serialized procedure (which was created at the same time as the
account) each time it is
asked for a withdrawal procedure.

(define (make-account balance)
(define (withdraw amount)
(if (>= balance amount)
(begin (set! balance (- balance amount))
balance)
"Insufficient funds"))
(define (deposit amount)
(set! balance (+ balance amount))
balance)
(let ((protected (make-serializer)))
(let ((protected-withdraw (protected withdraw))
(protected-deposit (protected deposit)))
(define (dispatch m)
(cond ((eq? m 'withdraw) protected-withdraw)
((eq? m 'deposit) protected-deposit)
((eq? m 'balance) balance)
(else (error "Unknown request -- MAKE-ACCOUNT"
m))))
dispatch)))

>> both version returns serialized inner function,
so they are essentially the same, but the 2nd "balance" var is
not "protected", so it can interwine when
multiple procedure is withdrawing and depositing.