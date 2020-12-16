; Exercise 2.71. Suppose we have a Huffman tree for an alphabet of n symbols, and that the relative
; frequencies of the symbols are 1, 2, 4, ..., 2n-1. Sketch the tree for n=5; for n=10. In such a tree (for
; general n) how may bits are required to encode the most frequent symbol? the least frequent symbol?


(define (tree-n-5)
  (generate-huffman-tree '((A 1) (B 2) (C 4) (D 8) (E 16)))
)

(encode-symbol 'A (tree-n-5))
; most frequent symbol: 1 bit
; least frequent symbol: 4 bit

(define (tree-n-10)
  (generate-huffman-tree '((A 1) (B 2) (C 4) (D 8) (E 16)
                           (F 32) (G 64) (H 128) (I 256) (J 512)
  ))
)
(encode-symbol 'J (tree-n-10))
; most frequent symbol: 1 bit
; least frequent symbol: 9 bit

; >> the implication is bits size increased only by 1, even when n doubled?
; >> looks like another theata log n thing