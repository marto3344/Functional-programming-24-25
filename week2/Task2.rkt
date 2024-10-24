#lang racket
(define (sum-digits-iter n)
    (define (calculate-sum result leftover)
      (if (< leftover 10)
          (+ result leftover)
          (calculate-sum (+ result (remainder leftover 10)) (quotient leftover 10))         

          )
      )
    (if(negative? n)
     (error "n has to be non-negative")
     (calculate-sum 0 n)
    )
   
  )
(= (sum-digits-iter 12345) 15)
(= (sum-digits-iter 123) 6)
(= (sum-digits-iter 123456789) 45);my test