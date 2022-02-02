Exercise 4.70: What is the purpose of the let bindings
in the procedures add-assertion! and add-rule! ? What
would be wrong with the following implementation of add-
assertion! ? Hint: Recall the definition of the infinite stream
of ones in Section 3.5.2: (define ones (cons-stream 1
ones)).

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

>> "cons-stream" second arguments is a delayed one and would not be evaludated unless used. the "let" line is to create another reference point for the current "THE-ASSERTIONS", so that when setting the new "THE-ASSERTIONS" would not falls in to an infinite loop of referring itself