Exercise 3.31. The internal procedure accept-action-procedure! defined in
make-wire
specifies that when a new action procedure is added to a wire, the procedure is
immediately run. Explain
why this initialization is necessary.

In particular, trace through the
half-adder example in the paragraphs
above and say how the system's response would differ if we had defined
accept-action-
procedure! as
(define (accept-action-procedure! proc)
    (set! action-procedures (cons proc action-procedures)))

>> basically it is given at the end of the (make-wire) section,
the init. is necessary to keep the initl state of each wire compoent
in the right signal state. (consider adding an invertor, the signal after
inverter compoenent need to be switched, this is done by the init part when
new wire was added
)

"The wire
communicates the change to its neighbors by calling the action procedures provided to it when the
connections were established."
