Exercise 4.18. Consider an alternative strategy for scanning out definitions that translates the example in
the text to
(lambda <vars>
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (let ((a <e1>)
          (b <e2>))
      (set! u a)
      (set! v b))
  <e3>))

Here a and b are meant to represent new variable names, created by the interpreter, that do not appear in
the user's program. Consider the solve procedure from section 3.5.4:
(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

Will this procedure work if internal definitions are scanned out as shown in this exercise? What if they are
scanned out as shown in the text? Explain.

>> basically the question is asking which form can accept that "u" depend on the defintion of "v". the question way will be setting y and dy, which is now a string with value "*unassigned", instead of a varible.

(lambda (f y0 dt)
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (let ((integral (delay dy) y0 dt)
          (b (stream-map f y)))
      (set! u a)
      (set! v b))
  y))

(lambda (f y0 dt)
  ((lambda (y dy)
     ((lambda (a b)
        (set! y a)
        (set! dy b))
      (integral (delay dy) y0 dt)
      (stream-map f y))
     y)
  '*unassigned*
  '*unassigned*))