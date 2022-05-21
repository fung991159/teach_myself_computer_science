Exercise 5.15: Add instruction counting to the register ma-
chine simulation. That is, have the machine model keep
track of the number of instructions executed. Extend the
machine model’s interface to accept a new message that
prints the value of the instruction count and resets the count
to zero.


>> all changes made in "make-new-machine"
in beginning let block, set instruction-count to 0 
(instruction-count 0)

in "excute", increment the count by 1 after instruction execution
(begin
  ((instruction-execution-proc (car insts)))
  (execute)
  (set! instruction-count (+ instruction-count 1))
)

create a new function to set instruction-count to zero
(define (execute)
  (set! instruction-count 0)
)

in "dispatch"
((eq? message 'print-instruction-count)
print-instruction-count)
((eq? message 'resets-instruction-count)
resets-instruction-count)