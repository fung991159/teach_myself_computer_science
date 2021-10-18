Exercise 4.57: Define a rule that says that person 1 can re-
place person 2 if either person 1 does the same job as person
2 or someone who does person 1’s job can also do person 2’s
job, and if person 1 and person 2 are not the same person.
Using your rule, give queries that find the following:

(rule (replacable ?person-1 ?person-2)
  (and
    (job ?person-1 ?person-1-job)
    (job ?person-2 ?person-2-job)
    (not (same ?person-1 ?person-2)
    (or (same ?person-1-job ?person-2-job)
        (can-do-job? ?person-1-job ?person-2-job))
    )))

a. all people who can replace Cy D. Fect;
>> (replacable ?person-1 (Fect Cy D))

b. all people who can replace someone who is being paid
more than they are, together with the two salaries.
>> (
  (and (replacable ?person-1 ?person-2)
       (salary ?person-1 ?amount-1)
       (salary ?person-2 ?amount-2)
       (lisp-value < ?amount-1 ?amount-2)
)