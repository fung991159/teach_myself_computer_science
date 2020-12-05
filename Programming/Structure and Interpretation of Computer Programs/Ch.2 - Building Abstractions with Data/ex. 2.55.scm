Exercise 2.55. Eva Lu Ator types to the interpreter the expression
; (car ''abracadabra)
; To her surprise, the interpreter prints back quote. Explain.

(car ''abracadabra)

; (display ''abracadabra) return (quote abracadabra), a list of two elemnt
; so the car of this list is the word "quote"
; it seems '' is a primitive symbol for the word "quote"

; !! it seems the "'" is translated as quote
; !! so (car (quote (quote abracadabra)))
; !! actually means car the expression of '(quote abracadabra)
; !! hence "quote" is returned as literal string