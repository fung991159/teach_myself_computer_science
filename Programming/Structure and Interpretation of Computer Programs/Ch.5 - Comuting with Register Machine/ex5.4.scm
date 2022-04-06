Exercise 5.4: Specify register machines that implement each
of the following procedures. For each machine, write a con-
troller instruction sequence and draw a diagram showing
the data paths.

>> see ex5.4.png for data path diagram

a. Recursive exponentiation:
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))
>> this is similar to factorial, where we need to expand all the expt, hence need to store value of n, expt value in a stack.

(controller
    (assign continue (label expt-done))
  expt-loop
    (test (op =) (reg n) (const 0))
    (branch (label base-case))
    (save continue)
    (save n)
    (assign n (op -) (reg n) (const 1))
    (assign continue (label after-expt))
    (goto (label expt-loop))
  after-expt
    (restore n)
    (restore continue)
    (assign val (op *) (reg b) (reg val))  ;; this is the only thing that changes from factorial. the difference is we are multipling by "b", which is a constant (in the loop context). Instead of a dynamic n, however we still need to store n in the stack because we "n" is used to count when we reach base case
    (goto (reg continue))
  base-case
    (assign val (const 1))
    (goto (reg continue))
  expt-done
)

b. Iterative exponentiation:
(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
      product
      (expt-iter (- counter 1)
                 (* b product))))
  (expt-iter n 1))
>> iterative process doesn't requires a stack to store temporary values, so it is whole lot simplier, just a one level loop, passing result of loop by storing in register

(controller
  expt-iter
    (test (op =) (reg counter) (const 0))
    (branch (label expt-done))
    (assign product (op *) (reg product) (reg b))
    (assign counter (op -) (reg counter) (const 1))
    (goto (label test))
  expt-done)