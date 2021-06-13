Exercise 3.25: Generalizing one- and two-dimensional tables, show how to
implement a table in which values are stored under an arbitrary number of keys
and different values may be stored under different numbers of keys. The lookup
and insert! procedures should take as input a list of keys used to access the
table.

>> was quite confused about what the question is asking for,
but looking at other solution and found this one is pretty neat,
using "." allows for multiple arguments passing in as list,
and the list itself was used as a key, no need to unpack it
and change the data structure.

(define (make-table)

  (let ((local-table (list '*table*)))

    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))

    (define (lookup . keys)
      (let ((record (assoc keys (cdr local-table))))
        (if record
            (cdr record)
            #f)))

    (define (insert! value . keys)
      (let ((record (assoc keys (cdr local-table))))
        (if record
            (set-cdr! record value)
                  (set-cdr! local-table
                            (cons (cons keys value)
                                  (cdr local-table)))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))


(define m (make-table))
((m 'insert-proc!) 12 'b 'c)
(display ((m 'lookup-proc) 'b 'cd))
