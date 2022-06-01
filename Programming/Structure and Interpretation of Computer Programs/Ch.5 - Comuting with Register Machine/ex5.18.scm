Exercise 5.18: Modify the make-register procedure of Sec-
tion 5.2.1 so that registers can be traced. Registers should
accept messages that turn tracing on and off.
When a register is traced, assigning a value to the register should:
  print the name of the register,
  the old contents of the register,
  and the new contents being assigned.

Extend the interface to the machine model to permit you to turn tracing on and
off for designated machine registers.

>> this is similar to ex 5.16, but simplier. we need to add the trace state and register-name as internal variable, so we can print them later

(define (make-register name)
  (let ((contents '*unassigned*))
        ((print-trace? 'False))
        ((register-name name))
    (define (set-register-trace-state state)
      set! print-trace? state
    )
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
              (lambda (value) 
                (begin
                  (if (print-trace?)
                    (display register-name)  ;; display register name
                    (display contents)  ;; old contents
                    (set! contents value)))
                    (display contents)))  ;; new contents
              ((eq? message 'trace-on) (set-register-trace-state 'True))
              ((eq? message 'trace-off) (set-register-trace-state 'False))
            (else
              (error "Unknown request: REGISTER" message))))
              dispatch))