Exercise 3.46. Suppose that we implement test-and-set! using an ordinary
procedure as shown in
the text, without attempting to make the operation atomic. Draw a timing
diagram like the one in
figure 3.29 to demonstrate how the mutex implementation can fail by allowing
two processes to acquire
the mutex at the same time.

>> see ex3.46.png
if atmoicity is not guaranteed, it is possbile for multiple "test-and-set"
to return False value, thereby making more than 1 mutex able to acquire a lock,
