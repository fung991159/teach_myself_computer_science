Exercise 4.58: Define a rule that says that a person is a “big
shot” in a division if the person works in the division but
does not have a supervisor who works in the division.

(rule (big shot ?person ?dept)
  (and
    (supervisor ?person ?supervisor)
    (job ?person (?dept . ?rest-person-job-title))
    (job ?supervisor (?supervisor-dept . ?rest-supervisor-job-title))
    (not (same ?dept ?supervisor-dept))
  )
)