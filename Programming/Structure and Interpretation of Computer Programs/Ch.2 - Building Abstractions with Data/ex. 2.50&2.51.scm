; Exercise 2.50. Define the transformation flip-horiz, which flips painters horizontally, and
; transformations that rotate painters counterclockwise by 180 degrees and 270 degrees. 
; >> pretty cool that need not to know the details of how the painter transform the image,
; >> just need to focus on how the frame turn around
(define (flip-horiz painter)
  (transform-painter painter
    (make-vect 1.0 0.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0))
)

(define (rotate-cc-180 painter)
  (transform-painter painter
    (make-vect 1.0 1.0)
    (make-vect 0.0 1.0)
    (make-vect 1.0 0.0))
)

(define (rotate-cc-270 painter)
  (transform-painter painter
    (make-vect 0.0 1.0)
    (make-vect 1.0 1.0)
    (make-vect 0.0 0.0))
)
; Exercise 2.51. Define the below operation for painters. Below takes two painters as arguments. The
; resulting painter, given a frame, draws with the first painter in the bottom of the frame and with the second
; painter in the top. Define below in two different ways -- first by writing a procedure that is analogous to
; the beside procedure given above, and again in terms of beside and suitable rotation operations (from
; exercise 2.50).

; >> raw version
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
  (let ((paint-upper
        (transform-painter painter1
                          split-point
                          (make-vect 1.0 0.5)
                          (make-vect 0.0 1.0)))
        (paint-lower
        (transform-painter painter2
                          (make-vect 0.0 0.0)
                          (make-vect 1.0 0.0)
                          split-point)))
  (lambda (frame)
    (paint-upper frame)
    (paint-lower frame)
  )
)

; >> using beside and procedure from 2.50
; >> I can only produce pesudo code for this, it is easier than I expected though :(
(define (below2 painter1 painter2)
  (rotate90 
    (beside (rotate270 painter1) 
            (rotate270 painter2))))

; ! I thought of rotating the resultant painter individually after beside,
; ! never thought it could be done together.

