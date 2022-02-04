Exercise 4.75: Implement for the query language a new
special form called unique. unique should succeed if there
is precisely one item in the data base satisfying a specified
query. For example,

(unique (job ?x (computer wizard)))

should print the one-item stream

(unique (job (Bitdiddle Ben) (computer wizard)))

since Ben is the only computer wizard, and

(unique (job ?x (computer programmer)))

should print the empty stream, since there is more than one
computer programmer. Moreover,

(and (job ?x ?j) (unique (job ?anyone ?j)))

should list all the jobs that are filled by only one person,
and the people who fill them.

There are two parts to implementing unique. The first is to
write a procedure that handles this special form, and the
second is to make qeval dispatch to that procedure. The
second part is trivial, since qeval does its dispatching in
a data-directed way. If your procedure is called uniquely-
asserted, all you need to do is
(put 'unique 'qeval uniquely-asserted)
and qeval will dispatch to this procedure for every query
whose type (car) is the symbol unique.

The real problem is to write the procedure uniquely-asserted.
This should take as input the contents (cdr) of the unique
query, together with a stream of frames. 

1. For each frame in the stream, it should use qeval to find the stream of all
extensions to the frame that satisfy the given query. 
2. Any stream that does not have exactly one item in it should be
eliminated.
3. The remaining streams should be passed back to be accumulated into one big stream that is the result of the unique query. This is similar to the implementation of the not special form.

Test your implementation by forming a query that lists all
people who supervise precisely one person.

(define (singleton-stream? frame-stream)
  (stream-null? (stream-cdr frame-stream))
)


(define (uniquely-asserted unique-query-pattern frame-stream)
  (stream-filter  ;  #step 2
    singleton-stream?
    (stream-flatmap ; #step 1
      (lambda (frame)
        (qeval unique-query-pattern frame)
      )
      frame-stream
    )
  )
)

>> my attempt to the solution, it seems after breaking the steps down is pretty approachable