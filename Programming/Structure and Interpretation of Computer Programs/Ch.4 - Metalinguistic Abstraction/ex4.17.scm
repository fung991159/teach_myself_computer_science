Exercise 4.17. Draw diagrams of the environment in effect when evaluating the expression <e3> in the
procedure in the text, comparing how this will be structured when definitions are interpreted sequentially
with how it will be structured if definitions are scanned out as described. 
>> if do it sequenitally, all the new environment will point to first evaluation of lambda.
>> if do it the transform way, extra frame need to be created to cater for the let statment, which point to the lambda as well.

Why is there an extra frame in the
transformed program? 

>> extra frame is created because let is just a syntic sugar of lambda

Explain why this difference in environment structure can never make a difference in
the behavior of a correct program. 
>> the extra frame is isolated and hence will not alter any behaviour

Design a way to make the interpreter implement the ``simultaneous''
scope rule for internal definitions without constructing the extra frame.
