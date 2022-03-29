Exercise 5.2: Use the register-machine language to describe
the iterative factorial machine of Exercise 5.1.

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

>> my attemp to convert it to machine language. It is simply converting the previous chart into text/code


(controller
  test-b
    (test (op >) (reg counter) (n))
    (branch (label factorial-done))
    (assign tmp_product (op mul) (reg product) (reg counter))
    (assign tmp_counter (op add) (reg counter) (const 1))
    (assign product (reg tmp_product))
    (assign couhnter (reg tmp_counter))
    (goto (label test-b))
  factorial-done)