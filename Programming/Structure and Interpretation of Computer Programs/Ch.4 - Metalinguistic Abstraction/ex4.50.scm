Exercise 4.50: Implement a new special form ramb that is
like amb except that it searches alternatives in a random or-
der, rather than from left to right. Show how this can help
with Alyssa’s problem in Exercise 4.49.

>> most likely a change is required in "analyze-amb",
since now it is fetching choice with cdring down the list of choices.

(define (analyze-amb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ; ((car choices)
            (let ((choice (get-random-choice choices))))
              env
              succeed
              (lambda () (try-next (remove-current-choice choices))))))
      (try-next cprocs))))
