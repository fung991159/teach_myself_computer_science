Exercise 4.48. Extend the grammar given above to handle more complex sentences. For example, you
could extend noun phrases and verb phrases to include adjectives and adverbs, or you could handle
compound sentences.


(define adjectives '(adjective wise friendly brave loyal bold trendy)) 

(define (parse-simple-noun-phrase)
  (list 'simple-noun-phrase
        (parse-word articles)
        (parse-word adjectives) ; new
        (parse-word nouns)))

(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
        (maybe-extend (list 'noun-phrase
                            noun-phrase
                            (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))
