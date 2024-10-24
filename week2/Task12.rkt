#lang racket

(define (find-sum a b n)
  (define (helper n result)
     (if(negative? n)
        result
        (helper (sub1 n) (+ result (* b (expt 2 n))))
      )
    )
    (+ a a a (helper (sub1 n) 0) (helper (- n 2) 0) (helper (- n 3) 0))
)

(= (find-sum 0 2 10) 3578) ; 510 + 1022 + 2046
(= (find-sum 5 3 5) 174) ; 26 + 50 + 98
(= (find-sum 0 2 12) 14330);my test
#|
  1. find-sum
  2. 3 params -> a b n
  3. all parameters are whole numbers
  4. a b n
  5. whole number
  6. Because we have a sequence that is defined recursively we need recursive function for calculating the n-th member of the sequence
|#