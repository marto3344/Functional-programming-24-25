#lang racket
(require math/number-theory)
(define (contains-digit? n d)
   (if (< n 10)
     (= n d)
     (or (= d (remainder n 10)) (contains-digit? (quotient n 10) d))
    )
  )
(define(sum-special-primes n d)
   (define (calculate s ptr leftover)
     (cond
       [(zero? leftover) s]
       [(and(prime? ptr) (contains-digit? ptr d)) (calculate(+ s ptr) (add1 ptr) (sub1 leftover))]
       [else (calculate s (add1 ptr) leftover)]
      )
    )
     (if(or(<= n 0)(negative? d))
       (error "params error")
       (calculate 0 2 n)
      )
  )
(= (sum-special-primes 5 2) 392)
(= (sum-special-primes 5 3) 107)
(= (sum-special-primes 10 3) 462)
(= (sum-special-primes 6 2)615);my test