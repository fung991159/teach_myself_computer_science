Exercise 4.66: Ben has been generalizing the query sys-
tem to provide statistics about the company. For example,
to find the total salaries of all the computer programmers
one will be able to say
  (sum ?amount (and (job ?x (computer programmer))
                    (salary ?x ?amount)))
In general, Ben’s new system allows expressions of the form
(accumulation-function
  ⟨variable⟩ ⟨query pattern⟩)
where accumulation-function can be things like sum, average,
or maximum. Ben reasons that it should be a cinch to imple-
ment this. He will simply feed the query pattern to qeval.
This will produce a stream of frames. He will then pass this
stream through a mapping function that extracts the value
of the designated variable from each frame in the stream
and feed the resulting stream of values to the accumulation
function. Just as Ben completes the implementation and is
about to try it out, Cy walks by, still puzzling over the wheel
query result in Exercise 4.65. When Cy shows Ben the sys-
tem’s response, Ben groans, “Oh, no, my simple accumula-
tion scheme won’t work!”
What has Ben just realized? Outline a method he can use
to salvage the situation.

>> Ben realized that it is possible to have duplicate in the query,
some method to make sure the output set is DISTINCT is required.