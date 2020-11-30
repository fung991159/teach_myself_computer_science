; Exercise 2.47. Here are two possible constructors for frames:
; (define (make-frame origin edge1 edge2)
;   (list origin edge1 edge2))
; (define (make-frame origin edge1 edge2)
;   (cons origin (cons edge1 edge2)))
; For each constructor supply the appropriate selectors to produce an implementation for frames.

; >>frame is flat list of 3 item
(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))
(define (get-origin frame)
    (car frame)
)
(define (get-edge1 frame)
    (car (cdr frame))
)
(define (get-edge2 frame)
    (car (cdr (cdr frame)))
)
; >>frame is cons of origin and cons of edge1 edge2, i.e. nested list
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; only get-edge2 is different
(define (get-edge2 frame)
    (cdr (cdr frame))
)