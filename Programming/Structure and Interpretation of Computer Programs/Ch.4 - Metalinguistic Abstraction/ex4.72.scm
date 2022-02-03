Exercise 4.72: Why do disjoin and stream-flatmap in-
terleave the streams rather than simply append them? Give
examples that illustrate why interleaving works better. (Hint:
Why did we use interleave in Section 3.5.3?)

>> interleave works better when the either stream is infinite.
Hence we won't be stucked in infinitly evalulate either one stream forever should it be inifinte