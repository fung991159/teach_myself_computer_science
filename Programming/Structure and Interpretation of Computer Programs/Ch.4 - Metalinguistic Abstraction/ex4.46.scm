Exercise 4.46. The evaluators in sections 4.1 and 4.2 do not determine what order operands are evaluated
in. We will see that the amb evaluator evaluates them from left to right. Explain why our parsing program
wouldn't work if the operands were evaluated in some other order.

>> *unparsed* is scanning word list from left to right, so it must be kept in this order.