; The ``eight-queens puzzle'' asks how to place eight queens on a chessboard so that no queen is in check
; from any other (i.e., no two queens are in the same row, column, or diagonal). One possible solution is
; shown in figure 2.8. One way to solve the puzzle is to work across the board, placing a queen in each
; column. Once we have placed k - 1 queens, we must place the kth queen in a position where it does not
; check any of the queens already on the board. We can formulate this approach recursively: Assume that we
; have already generated the sequence of all possible ways to place k - 1 queens in the first k - 1 columns of
; the board. For each of these ways, generate an extended set of positions by placing a queen in each row of
; the kth column. Now filter these, keeping only the positions for which the queen in the kth column is safe
; with respect to the other queens. This produces the sequence of all ways to place k queens in the first k
; columns. By continuing this process, we will produce not only one solution, but all solutions to the puzzle.
; We implement this solution as a procedure queens, which returns a sequence of all solutions to the
; problem of placing n queens on an n× n chessboard. Queens has an internal procedure queen-cols that
; returns the sequence of all ways to place queens in the first k columns of the board.
; (define (queens board-size)
; (define (queen-cols k)
; (if (= k 0)
; (list empty-board)
; (filter
; (lambda (positions) (safe? k positions))
; (flatmap
; (lambda (rest-of-queens)
; (map (lambda (new-row)
; (adjoin-position new-row k rest-of-queens))
; (enumerate-interval 1 board-size)))
; (queen-cols (- k 1))))))
; (queen-cols board-size))
; In this procedure rest-of-queens is a way to place k - 1 queens in the first k - 1 columns, and new-
; row is a proposed row in which to place the queen for the kth column. Complete the program by
; implementing the representation for sets of board positions, including the procedure adjoin-position,
; which adjoins a new row-column position to a set of positions, and empty-board, which represents an
; empty set of positions. You must also write the procedure safe?, which determines for a set of positions,
; whether the queen in the kth column is safe with respect to the others. (Note that we need only check
; whether the new queen is safe -- the other queens are already guaranteed safe with respect to each other.)
; Exercise 2.43. Louis Reasoner is having a terrible time doing exercise 2.42. His queens procedure seems
; to work, but it runs extremely slowly. (Louis never does manage to wait long enough for it to solve even the
; 6× 6 case.) When Louis asks Eva Lu Ator for help, she points out that he has interchanged the order of the
; nested mappings in the flatmap, writing it as
; (flatmap
; (lambda (new-row)
; (map (lambda (rest-of-queens)
; (adjoin-position new-row k rest-of-queens))
; (queen-cols (- k 1))))
; (enumerate-interval 1 board-size))
; Explain why this interchange makes the program run slowly. Estimate how long it will take Louis's
; program to solve the eight-queens puzzle, assuming that the program in exercise 2.42 solves the puzzle in
; time T.


>> 2.42is too difficult for me, tried to peek understand solution is pretty tough
>> among all solution this works best
>> http://jots-jottings.blogspot.com/2011/10/sicp-exercise-242-eight-queens-puzzle.html

>> it is kind of mind blowing to me that to check if the queen is diagonal, it is just
>> check the distance of current piece against target using the same row/column position,
>> i.e. the nature of the "diagonal"


; Exercise 2.43. Louis Reasoner is having a terrible time doing exercise 2.42. His queens procedure seems
; to work, but it runs extremely slowly. (Louis never does manage to wait long enough for it to solve even the
; 6× 6 case.) When Louis asks Eva Lu Ator for help, she points out that he has interchanged the order of the
; nested mappings in the flatmap, writing it as
; (flatmap
    ; (lambda (new-row)
        ; (map (lambda (rest-of-queens)
                ; (adjoin-position new-row k rest-of-queens))
            ;  (queen-cols (- k 1))))
    ; (enumerate-interval 1 board-size))
; Explain why this interchange makes the program run slowly. Estimate how long it will take Louis's
; program to solve the eight-queens puzzle, assuming that the program in exercise 2.42 solves the puzzle in
; time T.

>> queen-cols is where the recursive part happen
>> the original version will only call queen-cols on upper level in flatmap section
>> (for each queens column, for each queens row, find all queens possible positon)
>> but Louis version will call queen-cols in the nested mapping level
>> (for each new row, for each posssble queens position)
>> it seems it will produce irrelvant row for the filter to check...
>> though the factor of exact time in terms of T I have no idea.

