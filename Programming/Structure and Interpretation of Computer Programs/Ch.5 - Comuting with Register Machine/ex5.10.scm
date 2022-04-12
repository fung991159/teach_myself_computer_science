Exercise 5.10: Design a new syntax for register-machine
instructions and modify the simulator to use your new syn-
tax. Can you implement your new syntax without changing
any part of the simulator except the syntax procedures in
this section?

>> yes it is very simple since the program was designed with dispatch style interface

depending on the varialbe we need, then assign the varaible to the subroutine accordingly

inst labels machine pc flag stack ops

simply add a new syntax in "make-execution-procedure",
((eq? (car inst) 'do-new-thing)(make-new-thing inst machine labels ops pc))