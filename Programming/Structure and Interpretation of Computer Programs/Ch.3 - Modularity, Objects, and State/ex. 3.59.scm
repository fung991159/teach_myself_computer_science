Exercise 3.59. In section 2.5.3 we saw how to implement a polynomial arithmetic system representing
polynomials as lists of terms. In a similar way, we can work with power series, such as
represented as infinite streams. We will represent the series a0 + a1 x + a2 x2 + a3 x3 + ··· as the stream
whose elements are the coefficients a0, a1, a2, a3, ....

a. The integral of the series a0 + a1 x + a2 x2 + a3 x3 + ··· is the series
where c is any constant. Define a procedure integrate-series that takes as input a stream a0, a1, a2,
... representing a power series and returns the stream a0, (1/2)a1, (1/3)a2, ... of coefficients of the non-
constant terms of the integral of the series. (Since the result has no constant term, it doesn't represent a
power series. when we use integrate-series, we will cons on the appropriate constant.)

(define (integrate-series s)
  (streams-map / s integers))

b. The function x |-> ex is its own derivative. This implies that ex and the integral of ex are the same series,
except for the constant term, which is e0 = 1. Accordingly, we can generate the series for ex as

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

Show how to generate the series for sine and cosine, starting from the facts that the derivative of sine is
cosine and the derivative of cosine is the negative of sine:

>> derivative of sine is cosine
(define cosine-series
  (cons-stream 1 (integrate-series sine-series)))

>>  derivative of cosine is the negative of sine
(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series) -1)))
