Exercise 2.78. The internal procedures in the scheme-number package are essentially nothing more
than calls to the primitive procedures +, -, etc. It was not possible to use the primitives of the language
directly because our type-tag system requires that each data object have a type attached to it. In fact,
however, all Lisp implementations do have a type system, which they use internally. Primitive predicates
such as symbol? and number? determine whether data objects have particular types. Modify the
definitions of type-tag, contents, and attach-tag from section 2.4.2 so that our generic system
takes advantage of Scheme's internal type system. That is to say, the system should work as before except
that ordinary numbers should be represented simply as Scheme numbers rather than as pairs whose car is
the symbol scheme-number.

>> basically we are attaching 'scheme-number' tag in another level. type-tag and contents will adjust base on the first item of the datum
>> is number or not. If it is number then type-tag will tag it as scheme-number, while contents will take all of datum since there is no tag in datum

(define (attach-tag type-tag contents)
  (if (= type-tag 'scheme-number)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond (if (number? (car datum)))
          'scheme-number
        (if (symbol? (car datum)))
          (car datum)
        (else (error "Bad tagged datum -- TYPE-TAG" datum))
  )
)

(define (contents datum)
  (cond (if (number? (car datum)))
          datum
        (if (symbol? (car datum)))
          (cdr datum)
        (else (error "Bad tagged datum -- CONTENTS" datum))
  )
)

; (define (attach-tag type-tag contents)
;   (cons type-tag contents))

; (define (type-tag datum) ;; if carf is number, return scehme
;   (if (pair? datum)
;     (car datum)
;     (error "Bad tagged datum -- TYPE-TAG" datum)))

; (define (contents datum)  ;; if contents is number, return everything
;   (if (pair? datum)
;     (cdr datum)
;     (error "Bad tagged datum -- CONTENTS" datum)))
