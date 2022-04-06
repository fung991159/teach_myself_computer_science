Exercise 5.6: Ben Bitdiddle observes that the Fibonacci ma-
chine’s controller sequence has an extra save and an extra
restore, which can be removed to make a faster machine.
Where are these instructions?

>> in label "afterfib-n-1", there is (restore continue) and (save continue) that doesn't do anything at all.