Exercise 4.28. Eval uses actual-value rather than eval to evaluate the operator before passing it
to apply, in order to force the value of the operator. Give an example that demonstrates the need for this
forcing.

>> (define a (+ 1 1))
>> (define b (+ a 2))

>> if eval doesn't use "actual-value", the parameter a that pass to func b will be a "thunk" instead of actualy value, hence it will return an error


