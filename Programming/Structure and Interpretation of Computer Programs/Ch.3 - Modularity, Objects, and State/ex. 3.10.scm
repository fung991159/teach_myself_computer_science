Exercise 3.10: In the make-withdraw procedure, the local variable balance is
created as a parameter of make-withdraw. We could also create the local state
variable explicitly, using let, as follows:
(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
                balance)
                "Insufficient funds"))))

Recall from section 1.3.2 that let is simply syntactic sugar for a procedure
call:
  (let ((<var> <exp>)) <body>)
is interpreted as an alternate syntax for
  ((lambda (<var>) <body>) <exp>)
Use the environment model to analyze this alternate version of make-withdraw,
drawing figures like the ones above to illustrate the interactions
  (define W1 (make-withdraw 100))
    (W1 50)
  (define W2 (make-withdraw 100))
Show that the two versions of make-withdraw create objects with the same
behavior. How do the environment structures differ for the two versions? 

>> see ex3.10.png
the gimmick here is let is also a lambda function that need to be evaluated In
its own env with parameter "initial amount"

step by step:
1. make-withdraw in global env
2. To bind W1, initial-amount need to be evalulate in E1. but we still need to 
evalulate yet another lambda with parameter "balance"
3. Hence evaluating this lambda in E2, returning code to global env. But variable
stay in E2.
4. to excute (W1 50), now parameter "amount" need to be evaulated in E3, which will
set and change the value of "balance" in E2
5. W2 is an isolated object with its own environment E4 and E5.
