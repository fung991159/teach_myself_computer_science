Exercise 4.67: Devise a way to install a loop detector in the
query system so as to avoid the kinds of simple loops illus-
trated in the text and in Exercise 4.64. The general idea is
that the system should maintain some sort of history of its
current chain of deductions and should not begin process-
ing a query that it is already working on. Describe what
kind of information (patterns and frames) is included in
this history, and how the check should be made. (After you
study the details of the query-system implementation in
Section 4.4.4, you may want to modify the system to in-
clude your loop detector.)

>> write down the frame variable bounding to a location,
so if ?x is bound to Mickey and ?y bound to ?who, if this pair
occur before then it is time to break and stop the loop
