#lang racket
(require math/number-theory)
(define (sum-digits n)
   (if (< n 10)
     n
     (+(remainder n 10)(sum-digits (quotient n 10)))
    )
  )
(define (sum-divisible-numbers start finish k)
   (define (sum begin end)
     (cond
       [(> begin end) 0]
       [(divides? k (sum-digits begin)) (+ begin (sum (add1 begin) end))]
       [else (sum (add1 begin) end)]
       )
     )
    (sum (min start finish) (max start finish))

  )
(= (sum-divisible-numbers 0 10 5) 5)
(= (sum-divisible-numbers 0 100 5) 990)
(= (sum-divisible-numbers 100 0 5) 990)
(= (sum-divisible-numbers 10 0 5) 5); my test