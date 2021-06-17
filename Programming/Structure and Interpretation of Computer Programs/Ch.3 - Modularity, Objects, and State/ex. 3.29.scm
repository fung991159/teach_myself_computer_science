Exercise 3.29: Another way to construct an or-gate is as a compound digital
logic device, built from and-gates and inverters. Define a procedure or-gate
that accomplishes this. What is the delay time of the or-gate in terms of
and-gate-delay and inverter-delay?

>> it seems it is a certain law for this, using "and-gate" and "inverter"
to make an "or-gate"
"De Morgans's laws"
P OR Q = NOT( (NOT P) AND (NOT Q) )

 (define (or-gate a1 a2 output) 
 (define (alternative-or-action-procedure)
   (let ((c1 (make-wire)) 
         (c2 (make-wire)) 
         (c3 (make-wire))) 
     (inverter a1 c1) 
     (inverter a2 c2) 
     (and-gate c1 c2 c3) 
     (inverter c3 output)))
    (add-action! a1 alternative-or-action-procedure)
    (add-action! a2 alternative-or-action-procedure)
  'ok
  )