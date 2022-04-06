Exercise 5.5: Hand-simulate the factorial and Fibonacci ma-
chines, using some nontrivial input (requiring execution of
at least one recursive call). Show the contents of the stack
at each significant point in the execution.

>> (factorial 5)

n     continue        val     new-n       new-continue    new-val
5     fact-done       NULL    4           after-fact      NULL
4     after-fact      NULL    3           after-fact      NULL
.....
1     after-fact      NULL    1           after-fact      1       ; label base-case, where val has been assigned value 1, next step is to go to label after-fact
2     after-fact      1       3           after-fact      2*1=2
3     after-fact      2       4           after-fact      3*2=6
4     after-fact      6       5           after-fact      6*4=24
5     after-fact      24      6           fact-done       24*5=120

>> (fib 5)
n     continue      val      new-n        new-continue    new-val
5     fib-done      NULL     4            afterfib-n-1    NULL
4     afterfib-n-1  NULL     3            afterfib-n-1    NULL
.....
1     afterfib-n-1  NULL     1            afterfib-n-2    2       ; n finally less than 2, which jump to branch immediate-answer, after assigning val to 1, jump to after-fib-n-1.

