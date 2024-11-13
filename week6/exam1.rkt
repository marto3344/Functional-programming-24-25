#lang racket
(require math/number-theory)
(define (primes-prod n)
      (define (helper result start end)
         (cond
            [(> start end) result]
            [(prime? start) (helper (* result start) (add1 start) end)]
            [else (helper result (add1 start) end)]
           )
        )
    (if (negative? n)
      (error "n has to be non negative?")
      (helper 1 2 (integer-root n 2))
   )
  )

(= (primes-prod 12) 6)
(= (primes-prod 49) 210) 
(= (primes-prod 1200) 200560490130)  