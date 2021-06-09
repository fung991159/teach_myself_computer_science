Exercise 3.19: Redo Exercise 3-18 using an algorithm that takes only a constant amount of space. 
(This requires a very clever idea.)

https://en.wikipedia.org/wiki/Cycle_detection

>> from web search this seems to be a very common interview question
so it is about finding the repeating cycle without storing any visited item.
the turtle will only move along the list 1 step at a time, while the rabbit two,
if there is a loop in the list, eventually rabbit will catch up with turtle from behind,
so when their values are equal, we confirm there is a loop/ cycle. if either rabbit / turtle
exhausted the list, we confirm there isn't a cycle.


(define (contains-cycle? lst) 
   (define (safe-cdr l) 
     (if (pair? l) 
         (cdr l) 
         '())) 
   (define (iter a b) 
     (cond ((not (pair? a)) #f) 
           ((not (pair? b)) #f) 
           ((eq? a b) #t) 
           ((eq? a (safe-cdr b)) #t) 
           (else (iter (safe-cdr a) (safe-cdr (safe-cdr b)))))) 
   (iter (safe-cdr lst) (safe-cdr (safe-cdr lst)))) 

(contains-cycle? '(1 2))