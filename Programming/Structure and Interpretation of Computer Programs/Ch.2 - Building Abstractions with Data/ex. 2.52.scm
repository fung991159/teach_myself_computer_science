; Exercise 2.52. Make changes to the square limit of wave shown in figure 2.9 by working at each of the
; levels described above. In particular:
; a. Add some segments to the primitive wave painter of exercise 2.49 (to add a smile, for example).
(define wave-painter-segments
  (list (make-segment (make-vect 0.2 0.0) (make-vect 0.4 0.4))
        (make-segment (make-vect 0.4 0.4) (make-vect 0.3 0.5))
        (make-segment (make-vect 0.3 0.5) (make-vect 0.1 0.3))
        (make-segment (make-vect 0.1 0.3) (make-vect 0.0 0.6))
        (make-segment (make-vect 0.0 0.8) (make-vect 0.1 0.5))
        (make-segment (make-vect 0.1 0.5) (make-vect 0.3 0.6))
        (make-segment (make-vect 0.3 0.6) (make-vect 0.4 0.6))
        (make-segment (make-vect 0.4 0.6) (make-vect 0.3 0.8))
        (make-segment (make-vect 0.3 0.8) (make-vect 0.4 1.0))
        (make-segment (make-vect 0.6 1.0) (make-vect 0.7 0.8))
        (make-segment (make-vect 0.7 0.8) (make-vect 0.6 0.6))
        (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.6))
        (make-segment (make-vect 0.8 0.6) (make-vect 1.0 0.4))
        (make-segment (make-vect 1.0 0.2) (make-vect 0.6 0.4))
        (make-segment (make-vect 0.6 0.4) (make-vect 0.8 0.0))
        (make-segment (make-vect 0.7 0.0) (make-vect 0.5 0.3))
        (make-segment (make-vect 0.5 0.3) (make-vect 0.3 0.0))
        ; to make a smile is just adding another segments here, I just made up some vector, 
        ; this is gonna be a "V smile" lol ;D
        (make-segment (make-vect 0.8 0.4) (make-vect 0.7 0.5))
        (make-segment (make-vect 0.7 0.4) (make-vect 0.8 0.5))
    )
)

; b. Change the pattern constructed by corner-split (for example, by using only one copy of the up-
; split and right-split images instead of two).
(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
            (bottom-right (below right right))
            (corner (corner-split painter (- n 1))))
        (beside (below painter top-left)
        (below bottom-right corner))))))

; c. Modify the version of square-limit that uses square-of-four so as to assemble the corners in a
; different pattern. (For example, you might make the big Mr. Rogers look outward from each corner of the
; square.)
