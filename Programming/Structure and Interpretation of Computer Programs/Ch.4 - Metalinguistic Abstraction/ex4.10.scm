Exercise 4.10. By using data abstraction, we were able to write an eval procedure that is independent of
the particular syntax of the language to be evaluated. To illustrate this, design and implement a new syntax
for Scheme by modifying the procedures in this section, without changing eval or apply.


>> the syntax part is just how the eval procedure parse and "recognize"
what programmer want to do

existing:  (define (if? exp) (tagged-list? exp 'if))
NEW: (define (if? exp) (tagged-list? exp '_IF_))
