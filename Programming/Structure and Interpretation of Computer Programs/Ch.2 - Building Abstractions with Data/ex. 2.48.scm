; Exercise 2.48. A directed line segment in the plane can be represented as a pair of vectors -- the vector
; running from the origin to the start-point of the segment, and the vector running from the origin to the end-
; point of the segment. Use your vector representation from exercise 2.46 to define a representation for
; segments with a constructor make-segment and selectors start-segment and end-segment.

; from 2.46
(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect) v) (cdr v)

(define (add-vect v1 v2)
    (cons (+ (xcor-vect v1) (xcor-vect v2))
          (+ (ycor-vect v1) (ycor-vect v2))
    )
)

(define (sub-vect v1 v2)
    (cons (- (xcor-vect v1) (xcor-vect v2))
          (- (ycor-vect v1) (ycor-vect v2))
    )
)

(define (scale-vect s v)
    (cons (* s (xcor-vect v))
          (* s (ycor-vect v))
    )
)

; this is getting tedious, something the exercise is exceedingly hard or stupid liek this one.
(define (make-segment v1 v2)
  (cons v1 v2)
)

(define (start-segment s)
  (car segments)
)

(define (end-segment s)
  (cdr s)
)
