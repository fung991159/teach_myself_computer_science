; Exercise 2.49. Use segments->painter to define the following primitive painters:
; a. The painter that draws the outline of the designated frame.
; b. The painter that draws an ``X'' by connecting opposite corners of the frame.
; c. The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
; d. The wave painter.

(define (segments->painter segment-list)
    (lambda (frame)
        (for-each
            (lambda (segment)
                (draw-line
                    ((frame-coord-map frame) (start-segment segment))
                    ((frame-coord-map frame) (end-segment segment))))
            segment-list)))


(define c1 (make-vect 0 0))
(define c2 (make-vect 0 1))
(define c3 (make-vect 1 1))
(define c4 (make-vect 1 0))

; a. The painter that draws the outline of the designated frame.
(define outline
  (segments->painter (list (make-segment c1 c2)
                           (make-segment c2 c3)
                           (make-segment c3 c4)
                           (make-segment c4 c1))))
; b. The painter that draws an ``X'' by connecting opposite corners of the frame.
; basically this is just connecting between top-left, bottom-right and bottom-left, top-right
(define outline
  (segments->painter (list (make-segment c1 c3)
                           (make-segment c2 c4)
)))

; c. The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
; it is just finding midpoint of the two vector before passing into make-segment
; though this start to looks very ugly now

(define (midpoint-vect v1 v2)
  (cons 
    (/ (+ (xcor-vect v1) (xcor-vect v2)) 2) 
    (/ (+ (ycor-vect v1) (ycor-vect v2)) 2)
  )
)
(define outline
  (segments->painter (list (make-segment (midpoint-vect (c1 c2))
                           (make-segment (midpoint-vect (c2 c3))
                           (make-segment (midpoint-vect (c3 c4))
                           (make-segment (midpoint-vect (c4 c1))))))))))

; d. The wave painter.
; haha I will skip this one, this is more like drawing question than programming one.
