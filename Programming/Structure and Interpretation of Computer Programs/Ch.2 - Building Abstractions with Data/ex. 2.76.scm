Exercise 2.76. As a large system with generic operations evolves, new types of data objects or new
operations may be needed. For each of the three strategies -- generic operations with explicit dispatch, data-
directed style, and message-passing-style -- describe the changes that must be made to a system in order to
add new types or new operations. Which organization would be most appropriate for a system in which
new types must often be added? Which would be most appropriate for a system in which new operations
must often be added?

>> data-directed style should be suitable for new operations,;
>> as each new operation is simply to add an extra row in the dispatch table

>> for new type it seems message-passing is better, since only the dispatch precoedure
>> need to be changed and no where else.ssssssssssssss