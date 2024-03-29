Exercise 4.42. Solve the following ``Liars'' puzzle (from Phillips 1934):
Five schoolgirls sat for an examination. Their parents -- so they thought -- showed an
undue degree of interest in the result. They therefore agreed that, in writing home about the
examination, each girl should make one true statement and one untrue one. The following
are the relevant passages from their letters:

Betty: ``Kitty was second in the examination. I was only third.''
Ethel: ``You'll be glad to hear that I was on top. Joan was second.''
Joan: ``I was third, and poor old Ethel was bottom.''
Kitty: ``I came out second. Mary was only fourth.''
Mary: ``I was fourth. Top place was taken by Betty.''
What in fact was the order in which the five girls were placed?

>> this is probably the most straight froward but inefficient solution

(define (lier)
  (let ((betty (amb 1 2 3 4 5))
        (ethel (amb 1 2 3 4 5))
        (joan (amb 1 2 3 4 5))
        (kitty (amb 1 2 3 4 5))
        (mary (amb 1 2 3 4 5)))
    (require (or (and (= kitty 2) (not (= betty 3))) (and (not (= kitty 2)) (= betty 3))))
    (require (or (and (= ethel 1) (not (= joan 2))) (and (not (= ethel 1)) (= joan 2))))
    (require (or (and (= joan 3) (not (= ethel 5))) (and (not (= joan 3)) (= ethel 5))))
    (require (or (and (= kitty 2) (not (= mary 4))) (and (not (= kitty 2)) (= mary 4))))
    (require (or (and (= mary 4) (not (= betty 1))) (and (not (= mary 4)) (= betty 1))))
    (require
    (distinct? (list betty ethel joan kitty mary)))
    (list betty ethel joan kitty mary)))
