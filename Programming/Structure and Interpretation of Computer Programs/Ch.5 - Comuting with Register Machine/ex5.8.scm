Exercise 5.8: The following register-machine code is am-
biguous, because the label here is defined more than once:

start
  (goto (label here))
here
  (assign a (const 3))
  (goto (label there))
here
  (assign a (const 4))
  (goto (label there))
there

With the simulator as written, what will the contents of
register a be when control reaches there? Modify the extract-
labels procedure so that the assembler will signal an er-
ror if the same label name is used to indicate two different
locations.

>> register a will be 4 instead of 3, since assemble's  extract-labels function will run insts one by one. So the latter one "win".

To solve this issue, extra-labels will need to stored the label already processed, and raise an error if the same label is found from the processed history.