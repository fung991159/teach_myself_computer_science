Exercise 5.16: Augment the simulator to provide for in-
struction tracing. That is, before each instruction is executed,
the simulator should print the text of the instruction. Make
the machine model accept trace-on and trace-off mes-
sages to turn tracing on and off.

>> we need to set an new internal variable "print-trace", default to False
(let ((pc (make-register 'pc))
  (flag (make-register 'flag))
  (stack (make-stack))
  (the-instruction-sequence '())
  (print-trace? 'False)
  ))

>> the "dispatch" once again need to accept new procedures
(define (dispatch message)
  ...
  ...
  ((eq? message 'trace-on)
  (set-trace  'True))
  ((eq? message 'trace-off)
  (set-trace  'False))
  ...
  ...
)

>>"set-trace" would changed the internal variable "print-trace" to desired mode
(define (set-trace trace-state)
  (set! print-trace? trace-state)
)

>> finally before execute, we check the state of print-trace to decide whether we need to print instruction first before execution.

(define (execute)
  (let ((insts (get-contents pc)))
      (if (null? insts)
        'done
        (begin
          (if (print-trace?)  ; NEW!
            (display insts)
          )
          ((instruction-execution-proc (car insts)))
          (execute)))))

