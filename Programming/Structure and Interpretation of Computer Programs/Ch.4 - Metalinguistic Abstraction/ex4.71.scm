Exercise 4.71: Louis Reasoner wonders why the simple-
query and disjoin procedures (Section 4.4.4.2) are imple-
mented using explicit delay operations, rather than being
defined as follows:

(define (simple-query query-pattern frame-stream)
  (stream-flatmap
    (lambda (frame)
    (stream-append
      (find-assertions query-pattern frame)
      (apply-rules query-pattern frame)))
    frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave
        (qeval (first-disjunct disjuncts)
                frame-stream)
        (disjoin (rest-disjuncts disjuncts)
                  frame-stream))))

Can you give examples of queries where these simpler def-
initions would lead to undesirable behavior?

>> as the text suggested, without using "delay" it is possible to postpones looping in some cases. As the mickey and minnie example shown in the text, it can lead to inifinte loop. But with 2nd operand as "delay" stream, at least the interpretor would not stucked forever without producing any response.