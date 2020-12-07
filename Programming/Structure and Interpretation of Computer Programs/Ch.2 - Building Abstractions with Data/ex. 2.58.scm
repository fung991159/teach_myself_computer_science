; Exercise 2.58. Suppose we want to modify the differentiation program so that it works with ordinary
; mathematical notation, in which + and * are infix rather than prefix operators. Since the differentiation
; program is defined in terms of abstract data, we can modify it to work with different representations of
; expressions solely by changing the predicates, selectors, and constructors that define the representation of
; the algebraic expressions on which the differentiator is to operate.
; a. Show how to do this in order to differentiate algebraic expressions presented in infix form, such as (x +
; (3 * (x + (y + 2)))). To simplify the task, assume that + and * always take two arguments and
; that expressions are fully parenthesized.

; >> once again I get the coding part right without ever understaing how it reach the answer 4 lol.
; >> it is very powerful to have the deriv unchange and chagning just the constructor, predicate and selector.
; >> power of good programming, blow my mind!

(define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))
(define (product? x)
    (and (pair? x) (eq? (cadr x) '*)))

(define (addend s) (car s))
(define (augend s) (caddr s))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))


; b. The problem becomes substantially harder if we allow standard algebraic notation, such as (x + 3 *
; (x + y + 2)), which drops unnecessary parentheses and assumes that multiplication is done before
; addition. Can you design appropriate predicates, selectors, and constructors for this notation such that our
; derivative program still works?

; >> can't figure out this one, there is solution onlien that is very complicated,
; >> will skip one for now.