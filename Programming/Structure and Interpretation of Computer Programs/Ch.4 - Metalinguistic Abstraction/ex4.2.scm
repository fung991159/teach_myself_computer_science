Exercise 4.2. Louis Reasoner plans to reorder the cond clauses in eval so that the clause for procedure
applications appears before the clause for assignments. He argues that this will make the interpreter more
efficient: Since programs usually contain more applications than assignments, definitions, and so on, his
modified eval will usually check fewer clauses than the original eval before identifying the type of an
expression.

a. What is wrong with Louis's plan? (Hint: What will Louis's evaluator do with the expression (define x 3)?)

>> define will return error because "define" is not an operator, nor it is an 
variable

b. Louis is upset that his plan didn't work. He is willing to go to any lengths to make his evaluator
recognize procedure applications before it checks for most other kinds of expressions. Help him by
changing the syntax of the evaluated language so that procedure applications start with call. For
example, instead of (factorial 3) we will now have to write (call factorial 3) and instead
of (+ 1 2) we will have to write (call + 1 2).

>> by changing the application? method to expect the "call" keyword, then we can handle applcation before everythign else. i.e. the reason original application? doesn't need to do it is because previous component already filtered out all other possibility.

(define (application? exp)  
  (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

