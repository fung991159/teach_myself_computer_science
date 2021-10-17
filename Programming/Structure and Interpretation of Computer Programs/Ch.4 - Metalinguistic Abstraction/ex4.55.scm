Exercise 4.55: Give simple queries that retrieve the follow-
ing information from the data base:
1. all people supervised by Ben Bitdiddle;
>> (supervisor ?name (Ben Bitdiddle))
2. the names and jobs of all people in the accounting di-
vision;
>> (job ?name (accounting . ?type))
3. the names and addresses of all people who live in Slumerville.
>> (address ?name (Slumerville . ?street))


