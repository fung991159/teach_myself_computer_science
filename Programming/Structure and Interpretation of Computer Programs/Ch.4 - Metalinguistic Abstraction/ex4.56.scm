Exercise 4.56: Formulate compound queries that retrieve
the following information:

>> this part is kind of interesting that it is quite similar to SQL

a. the names of all people who are supervised by Ben
Bitdiddle, together with their addresses;
>> (and (supervisor ?name (Bitdiddle Ben))
       (address ?name ?address))

b. all people whose salary is less than Ben Bitdiddle’s,
together with their salary and Ben Bitdiddle’s salary;
>> (and (salary ?person ?amount)
        (salary (Bitdiddle Ben) ?ben-salary)
        (lisp-value < ?amount ?ben-salary))

c. all people who are supervised by someone who is not
in the computer division, together with the supervi-
sor’s name and job.

>> (and
    (supervisor ?person ?supervisor)
    (not (job ?supervisor (computer . ?dept)))
    (job ?supervisor ?job-title))
