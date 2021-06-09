

Exercise 3.20. Draw environment diagrams to illustrate the evaluation of the sequence of expressions
(define x (cons 1 2))
(define z (cons x x))
(set-car! (cdr z) 17)
(car x)
17

(define (cons x y)
    (define (set-x! v) (set! x v))
    (define (set-y! v) (set! y v))
    (define (dispatch m)
        (cond ((eq? m 'car) x)
        ((eq? m 'cdr) y)
        ((eq? m 'set-car!) set-x!)
        ((eq? m 'set-cdr!) set-y!)
        (else (error "Undefined operation -- CONS" m))))
        dispatch)
(define (car z) (z 'car))
(define (cdr z) (z 'cdr))
(define (set-car! z new-value)
    ((z 'set-car!) new-value)
z)
(define (set-cdr! z new-value)
    ((z 'set-cdr!) new-value)
    z)

using the procedural implementation of pairs given above. (Compare exercise 3.11.)

>> see ex3.20.png. This is pretty damn complicated, but partly thanks to 
>> author make use of confusing parameter naming of "x", "y"

(define v (cons 1 2))
(define z (cons v v))
1. object v and z will be created in global env, with all the method, 
including dispatch located in E1, and E2 respectively.

(set-car! (cdr z) 17)
2. (cdr z) will need to be evaluated first, cdr is from global env, 
hence E3 point to global env, which return "(z 'cdr)"

(z 'cdr)
3. E4 will point to dispatch in E2, return y in E2, which is v in global env

(set-car! v 17)
4. set-car! is func from global env, E5 will point to gloval env, return
"(v 'set-car!) 17)"

(v 'set-car!)
5. E6 will point to dispatch in E1, return "set-x!"

(set-x! 17)
6. This happens in E2, which eval to (set! x 17) for v. hence finally 
(car v) eval to "17"