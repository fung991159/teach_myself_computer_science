Exercise 3.47. A semaphore (of size n) is a generalization of a mutex. Like a
mutex, a semaphore
supports acquire and release operations, but it is more general in that up to n
processes can acquire it
concurrently. Additional processes that attempt to acquire the semaphore must
wait for release operations.
Give implementations of semaphores
    a. in terms of mutexes
    b. in terms of atomic test-and-set! operations.

>> in term of mutexes, if there is available slot of mutex, the acquire it,
otherwise retry. once a mutex is release then release the cnt
(define (semaphores n)
    (let ((cnt 0)
          (mutex (make-mutex)))
    (define (the-semaphore m)
      (if (= cnt n)
        (mutex 'acquire)); set mutex's cell to True

      (cond ((eq? m 'acquire)
                (if (> cnt n)
                  (the-semaphore 'acquire) ; retry
                  (set! cnt (+ cnt 1))
                ))
              ((eq? m 'release)
                (set! cnt (- cnt 1))
                (mutex m)
              )))
    )
    the-semaphore)

>> in terms of atomic test-and-set! operations
>> this is actually quite bizzare, it is best to change the
code of "test-and-set!" to accomodate the semaphores

(define (semaphores n)
  (let ((cnt 0)
        (cell (list false))
  )
  (define (the-semaphore m)
    ; if count reach the maximum available, set cell to True
    ; until released
    (if (= n cnt)
      (test-and-set! (list false)))

    (cond ((eq? m 'acquire)
            (if (test-and-set! cell)
              (the-semaphore 'acquire) ; retry acquire
              (set! cnt (+ cnt 1))
              ))
          ((eq? m 'release)
            (set! cnt (- cnt 1))
            (clear! cell))
    )
  )
  the-semaphore
)

