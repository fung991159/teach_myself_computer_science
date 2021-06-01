; Exercise 3.8: When we defined the evaluation model in section 1.1.3, we said
; that the first step in evaluating an expression is to evaluate its
; subexpressions. But we never specified the order in which the subexpressions
; should be evaluated (e.g., left to right or right to left). When we introduce
; assignment, the order in which the arguments to a procedure are evaluated can
; make a difference to the result. Define a simple procedure f such that
; evaluating (+ (f 0) (f 1)) will return 0 if the arguments to + are evaluated
; from left to right but will return 1 if the arguments are evaluated from right
; to left.

; >> another hard to understand question. Basically I think the question
; is asking for a stateful function, where it would return the input value only
; once (or in between, hence return input value only at 1st, 3rd, 5th call etc)

(define (f)
  (let ((return-val #t))
    (lambda (num)
      (display "current state: ") (display return-val) (newline)
      (if (eq? return-val #t)
        (begin
          (set! return-val #f)
          num
        )
        (set! return-val #t)
      )
)))

; >> result
; current state: #t
; 1
; current state: #f