Exercise 4.49. Alyssa P. Hacker is more interested in generating interesting sentences than in parsing them.
She reasons that by simply changing the procedure parse-word so that it ignores the ``input sentence''
and instead always succeeds and generates an appropriate word, we can use the programs we had built for
parsing to do generation instead. Implement Alyssa's idea, and show the first half-dozen or so sentences
generated.

>> basically remove the check if word-list is member of the input sentence,
this way all the word will be picked up randomly by amb. also a helper function "get_rand_word" is required to pick one item from word-list randomly

(define (get_rand_word word-list)
  (require (not (null? word-list)))
  (amb (car word-list) (get_rand_word (cdr word-list)))
)

(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  ;(require (memq (car *unparsed*) (cdr word-list)))
  (let ((found-word (get_rand_word (cdr word-list)))) ; change this to pick from word-list, instead of from user input
    (set! *unparsed* (cdr *unparsed*))
    (list (car word-list) found-word)))

