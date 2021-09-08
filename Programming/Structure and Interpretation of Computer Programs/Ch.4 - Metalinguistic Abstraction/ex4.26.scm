Exercise 4.26. Ben Bitdiddle and Alyssa P. Hacker disagree over the importance of lazy evaluation for
implementing things such as unless. Ben points out that it's possible to implement unless in
applicative order as a special form. Alyssa counters that, if one did that, unless would be merely syntax,
not a procedure that could be used in conjunction with higher-order procedures. Fill in the details on both
sides of the argument. Show how to implement unless as a derived expression (like cond or let), and
give an example of a situation where it might be useful to have unless available as a procedure, rather
than as a special form.


>> Ben is right about
>> Alyssa is right about not able to pass around "unless" as argument, just like we can't pass "cond", "if" as argument. so we don't be able to use "map" with the syntax for example.



>> unless as a syntax, basically just a extension using if
(define (eval-unless exp)
  (unless->if (unless-clauses exp))
)

((unless? exp)
  (tagged-list? exp 'unless)
)
(define (unless-clauses exp) (cdr exp))
lauses))

(define (unless->if clauses)
  (let ((condition (car clauses))
        (usual-value (cadr clauses))
        (exceptional-value (caddr clauses)))
  (if condition
    exceptional-value
    usual-value))
)

