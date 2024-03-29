Exercise 4.63: Define following data base (see Genesis 4) traces
the genealogy of the descendants of Ada back to Adam, by
way of Cain
(son Adam Cain)
(son Cain Enoch)
(son Enoch Irad)
(son Irad Mehujael)
(son Mehujael Methushael)
(son Methushael Lamech)
(wife Lamech Ada)
(son Ada Jabal)
(son Ada Jubal)
Formulate rules such as “If S is the son of f , and f is the
son of G, then S is the grandson of G” and “If W is the wife
of M , and S is the son of W , then S is the son of M ” (which
was supposedly more true in biblical times than today) that
will enable the query system to find the grandson of Cain;
the sons of Lamech; the grandsons of Methushael. (See Ex-
ercise 4.69 for some rules to deduce more complicated re-
lationships.)

(rule (father ?s ?f)
      (or (son ?f ?s)
          (and (son ?f ?w)
              (wife ?f ?w))
(rule (grandson ?g ?s)
      (and (son ?f ?s)
           (son ?g ?f)
)