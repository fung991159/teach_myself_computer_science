; Exercise 2.72. Consider the encoding procedure that you designed in exercise 2.68. What is the order of
; growth in the number of steps needed to encode a symbol? Be sure to include the number of steps needed
; to search the symbol list at each node encountered. To answer this question in general is difficult. Consider
; the special case where the relative frequencies of the n symbols are as described in exercise 2.71, and give
; the order of growth (as a function of n) of the number of steps needed to encode the most frequent and least
; frequent symbols in the alphabet.

; if the tree is balanced, then n can be log n since every iteration will halve the number of node
; the program need to look into
; at the extreme case of one sided tree as (ex. 2.71), order of growth will be n-1, since each
; level can only house 2 node. so each new symbol will need to add one extra level.
